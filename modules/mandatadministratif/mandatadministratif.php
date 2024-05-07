<?php

use PrestaShop\PrestaShop\Core\Payment\PaymentOption;

if (!defined ('_PS_VERSION_')) {
    exit;
}

class Mandatadministratif extends PaymentModule
{
    public $extra_mail_vars;
    protected $postError;
    protected $html;
    protected $company_name;
    protected $company_address;
    protected $acount_owner;
    protected $acount_details;
    protected $acount_address;

    public function __construct()
    {
        $this->name = 'mandatadministratif';
        $this->tab = 'payments_gateways';
        $this->version = '1.0.0';
        $this->author = 'Momo';

        $config = Configuration::getMultiple ([
            'MANDATADMINISTRATIF_COMPANY_NAME',
            'MANDATADMINISTRATIF_COMPANY_ADDRESS',
            'MANDATADMINISTRATIF_ACCOUNT_OWNER',
            'MANDATADMINISTRATIF_ACCOUNT_DETAILS',
            'MANDATADMINISTRATIF_ACCOUNT_ADDRESS'
        ]);

        if (!empty($config['MANDATADMINISTRATIF_COMPANY_NAME'])) {
            $this->company_name = $config['MANDATADMINISTRATIF_COMPANY_NAME'];
        }
        if (!empty($config['MANDATADMINISTRATIF_COMPANY_ADDRESS'])) {
            $this->company_address = $config['MANDATADMINISTRATIF_COMPANY_ADDRESS'];
        }
        if (!empty($config['MANDATADMINISTRATIF_ACCOUNT_OWNER'])) {
            $this->acount_owner = $config['MANDATADMINISTRATIF_ACCOUNT_OWNER'];
        }
        if (!empty($config['MANDATADMINISTRATIF_ACCOUNT_DETAILS'])) {
            $this->acount_details = $config['MANDATADMINISTRATIF_ACCOUNT_DETAILS'];
        }
        if (!empty($config['MANDATADMINISTRATIF_ACCOUNT_ADDRESS'])) {
            $this->acount_address = $config['MANDATADMINISTRATIF_ACCOUNT_ADDRESS'];
        }

        $this->bootstrap = true;

        parent::__construct ();

        $this->displayName = $this->l ('Administratif mandat');
        $this->description = $this->l ('To add administratif payment possibility');

        $this->limited_countries = array('FR');
        $this->limited_currencies = array('EUR');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);

        if (!isset($this->company_name) || !isset($this->company_address)) {
            $this->warning = $this->l ('Company name and address must be configured before using this module.');
        }

        if (!isset($this->acount_owner) || !isset($this->acount_details) || !isset($this->acount_address)) {
            $this->warning = $this->l ('Acount owner, details and address must be configured before using this module.');
        }

        $this->extra_mail_vars = [
            '{account_owner}' => $this->acount_owner,
            '{company_name}' => $this->company_name,
            '{account_details}' => str_replace ("\n", '<br />', $this->acount_details),
            '{account_address}' => str_replace ("\n", '<br />', $this->acount_address),
            '{company_address}' => str_replace ("\n", '<br />', $this->company_address)
        ];
    }

    public function install()
    {
        $iso_code = Country::getIsoById (Configuration::get ('PS_COUNTRY_DEFAULT'));

        if (in_array ($iso_code, $this->limited_countries) == false) {
            $this->_errors[] = $this->l ('This module is not available in your country');
            return false;
        }

        // Install default
        if (!parent::install ()) {
            return false;
        }

        // Registration order status
        if (!$this->installOrderState ()) {
            return false;
        }

        // Registration hooks
        if (!$this->registerHook ('paymentReturn')
            || !$this->registerHook ('paymentOptions')) {
            return false;
        }

        // Configuration
        if (!Configuration::updateValue ('MANDATADMINISTRATIF_COMPANY_NAME', '')
            || !Configuration::updateValue ('MANDATADMINISTRATIF_COMPANY_ADDRESS', '')
            || !Configuration::updateValue ('MANDATADMINISTRATIF_ACCOUNT_OWNER', '')
            || !Configuration::updateValue ('MANDATADMINISTRATIF_ACCOUNT_DETAILS', '')
            || !Configuration::updateValue ('MANDATADMINISTRATIF_ACCOUNT_ADDRESS', '')
        ) {
            return false;
        }

        // Email
        $source = _PS_MODULE_DIR_ . 'mandatadministratif/mandat.html';
        $destination = _PS_ROOT_DIR_ . '/mails/fr/mandat.html';
        copy ($source, $destination);
        $source = _PS_MODULE_DIR_ . 'mandatadministratif/mandat.txt';
        $destination = _PS_ROOT_DIR_ . '/mails/fr/mandat.txt';
        copy ($source, $destination);

        return true;
    }

    /**
     * Create order state
     * @return boolean
     */
    public function installOrderState()
    {
        if (!Configuration::get ('MANDATADMINISTRATIF_WAITING')
            || !Validate::isLoadedObject (new OrderState(Configuration::get ('MANDATADMINISTRATIF_WAITING')))) {
            $order_state = new OrderState();
            $order_state->name = array();
            foreach (Language::getLanguages () as $language) {
                if (Tools::strtolower ($language['iso_code']) == 'fr') {
                    $order_state->name[$language['id_lang']] = 'En attente de bon de commande';
                } else {
                    $order_state->name[$language['id_lang']] = 'Waiting for command form';
                }
            }
            $order_state->module_name = 'mandatadministratif';
            $order_state->send_email = true;
            $order_state->template = 'mandat';
            $order_state->color = '#4169E1';
            $order_state->hidden = false;
            $order_state->delivery = false;
            $order_state->logable = false;
            $order_state->invoice = false;
            if ($order_state->add ()) {
                $source = _PS_MODULE_DIR_ . 'mandatadministratif/views/img/os_mandat.gif';
                $destination = _PS_ROOT_DIR_ . '/img/os/' . (int)$order_state->id . '.gif';
                copy ($source, $destination);
            }
            Configuration::updateValue ('MANDATADMINISTRATIF_WAITING', (int)$order_state->id);
        }
        return true;
    }

    public function uninstall()
    {
        $config = [
            'MANDATADMINISTRATIF_COMPANY_NAME',
            'MANDATADMINISTRATIF_COMPANY_ADDRESS',
            'MANDATADMINISTRATIF_ACCOUNT_OWNER',
            'MANDATADMINISTRATIF_ACCOUNT_DETAILS',
            'MANDATADMINISTRATIF_ACCOUNT_ADDRESS',
            'MANDATADMINISTRATIF_WAITING'
        ];

        foreach ($config as $var) {
            Configuration::deleteByName ($var);
        }

        return parent::uninstall ();
    }

    /**
     * Load the configuration form
     */
    public function getContent()
    {
        $output = $this->context->smarty->fetch ($this->local_path . 'views/templates/admin/infos.tpl');

        $this->html .= $output;

        if (Tools::isSubmit ('submitMandatadministratifModule')) {
            $this->postValidation ();
            if (!empty($this->postError)) {
                $this->html .= $this->displayError ($this->postError);
                $this->html .= $this->renderForm ();
            }
            $this->html .= $this->displayConfirmation ($this->trans ('Settings updated', array(), 'Admin.Global'));
        } else {
            $this->html .= '<br />';
        }

        $this->html .= $this->renderForm ();

        return $this->html;
    }

    /**
     * Validation form data.
     */
    protected function postValidation()
    {
        Configuration::updateValue ('MANDATADMINISTRATIF_COMPANY_NAME', Tools::getValue ('MANDATADMINISTRATIF_COMPANY_NAME'));
        if (!Tools::getValue ('MANDATADMINISTRATIF_COMPANY_NAME')) {
            $this->postError = $this->l ('Company name is required.');
            return;
        }

        Configuration::updateValue ('MANDATADMINISTRATIF_COMPANY_ADDRESS', Tools::getValue ('MANDATADMINISTRATIF_COMPANY_ADDRESS'));
        if (!Tools::getValue ('MANDATADMINISTRATIF_COMPANY_ADDRESS')) {
            $this->postError = $this->l ('Company address is required.');
            return;
        }

        Configuration::updateValue ('MANDATADMINISTRATIF_ACCOUNT_OWNER', Tools::getValue ('MANDATADMINISTRATIF_ACCOUNT_OWNER'));
        if (!Tools::getValue ('MANDATADMINISTRATIF_ACCOUNT_OWNER')) {
            $this->postError = $this->l ('Acount owner is required.');
            return;
        }

        Configuration::updateValue ('MANDATADMINISTRATIF_ACCOUNT_DETAILS', Tools::getValue ('MANDATADMINISTRATIF_ACCOUNT_DETAILS'));
        if (!Tools::getValue ('MANDATADMINISTRATIF_ACCOUNT_DETAILS')) {
            $this->postError = $this->l ('Acount details are required.');
            return;
        }

        Configuration::updateValue ('MANDATADMINISTRATIF_ACCOUNT_ADDRESS', Tools::getValue ('MANDATADMINISTRATIF_ACCOUNT_ADDRESS'));
        if (!Tools::getValue ('MANDATADMINISTRATIF_ACCOUNT_ADDRESS')) {
            $this->postError = $this->l ('Acount bank address is required.');
            return;
        }
    }

    /**
     * Create the form that will be displayed in the configuration of your module.
     */
    protected function renderForm()
    {
        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get ('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitMandatadministratifModule';
        $helper->currentIndex = $this->context->link->getAdminLink ('AdminModules', false)
            . '&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name;
        $helper->token = Tools::getAdminTokenLite ('AdminModules');

        $helper->tpl_vars = [
            'fields_value' => $this->getFormValues (),
            'languages' => $this->context->controller->getLanguages (),
            'id_language' => $this->context->language->id,
        ];

        return $helper->generateForm (array($this->getForm ()));
    }

    protected function getFormValues()
    {
        return [
            'MANDATADMINISTRATIF_COMPANY_NAME' => Configuration::get ('MANDATADMINISTRATIF_COMPANY_NAME', null),
            'MANDATADMINISTRATIF_COMPANY_ADDRESS' => Configuration::get ('MANDATADMINISTRATIF_COMPANY_ADDRESS', null),
            'MANDATADMINISTRATIF_ACCOUNT_OWNER' => Configuration::get ('MANDATADMINISTRATIF_ACCOUNT_OWNER', null),
            'MANDATADMINISTRATIF_ACCOUNT_DETAILS' => Configuration::get ('MANDATADMINISTRATIF_ACCOUNT_DETAILS', null),
            'MANDATADMINISTRATIF_ACCOUNT_ADDRESS' => Configuration::get ('MANDATADMINISTRATIF_ACCOUNT_ADDRESS', null)
        ];
    }

    protected function getForm()
    {
        return [
            'form' => [
                'legend' => [
                    'title' => $this->l ('Acount informations'),
                    'icon' => 'icon-info-circle',
                ],
                'input' => [
                    [
                        'col' => 5,
                        'type' => 'text',
                        'name' => 'MANDATADMINISTRATIF_COMPANY_NAME',
                        'label' => $this->l ('Company name')
                    ],
                    [
                        'col' => 5,
                        'type' => 'textarea',
                        'name' => 'MANDATADMINISTRATIF_COMPANY_ADDRESS',
                        'label' => $this->l ('Company address')
                    ],
                    [
                        'col' => 5,
                        'type' => 'text',
                        'name' => 'MANDATADMINISTRATIF_ACCOUNT_OWNER',
                        'label' => $this->l ('Account owner')
                    ],
                    [
                        'col' => 5,
                        'type' => 'textarea',
                        'name' => 'MANDATADMINISTRATIF_ACCOUNT_DETAILS',
                        'label' => $this->l ('Details')
                    ],
                    [
                        'col' => 5,
                        'type' => 'textarea',
                        'name' => 'MANDATADMINISTRATIF_ACCOUNT_ADDRESS',
                        'label' => $this->l ('Bank address')
                    ],
                ],
                'submit' => [
                    'title' => $this->l ('Save')
                ],
            ],
        ];
    }

    /**
     * This hook is used to display the order confirmation page.
     */
    public function hookPaymentReturn($params)
    {
        if (!$this->active) {
            return;
        }

        $this->smarty->assign ([
            'total_to_pay' => Tools::displayPrice (
                $params['order']->getOrdersTotalPaid (),
                new Currency($params['order']->id_currency),
                false
            ),
            'shop_name' => $this->context->shop->name,
            'id_order' => $params['order']->id,
            'company_name' => Configuration::get ('MANDATADMINISTRATIF_COMPANY_NAME'),
            'company_address' => Configuration::get ('MANDATADMINISTRATIF_COMPANY_ADDRESS')
        ]);
        if (isset($params['order']->reference) && !empty($params['order']->reference)) {
            $this->smarty->assign ('reference', $params['order']->reference);
        }

        return $this->fetch ('module:mandatadministratif/views/templates/hook/payment_return.tpl');
    }

    public function hookPaymentOptions($params)
    {
        if (!$this->active) {
            return;
        }

        if (!$this->checkCurrency ($params['cart'])) {
            return;
        }

        $newOption = new PaymentOption();
        $newOption->setModuleName ($this->name)
            ->setCallToActionText ($this->l ('Pay by administrative mandat'))
            ->setAction ($this->context->link->getModuleLink ($this->name, 'validation', array(), true))
            ->setAdditionalInformation ($this->fetch ('module:mandatadministratif/views/templates/hook/displayPayment.tpl'));

        return [$newOption];
    }

    public function checkCurrency($cart)
    {
        $currency_order = new Currency((int)($cart->id_currency));
        $currencies_module = $this->getCurrency ((int)$cart->id_currency);

        if (is_array ($currencies_module)) {
            foreach ($currencies_module as $currency_module) {
                if ($currency_order->id == $currency_module['id_currency']) {
                    return true;
                }
            }
        }
        return false;
    }
}
