<?php

class MandatadministratifValidationModuleFrontController extends ModuleFrontController
{
    public function postProcess()
    {
        $cart = $this->context->cart;

        if ($cart->id_customer == 0 || $cart->id_address_delivery == 0 || $cart->id_address_invoice == 0 || !$this->module->active) {
            Tools::redirect('index.php?controller=order&step=1');
        }

        $customer = new Customer($cart->id_customer);

        if (!Validate::isLoadedObject($customer)) {
            Tools::redirect('index.php?controller=order&step=1');
        }

        $currency = $this->context->currency;
        $total = (float)$cart->getOrderTotal(true, Cart::BOTH);

        $mailVars =    array(
            '{account_owner}' => Configuration::get('MANDATADMINISTRATIF_ACCOUNT_OWNER'),
            '{company_name}' => Configuration::get('MANDATADMINISTRATIF_COMPANY_NAME'),
            '{account_address}' => str_replace("\n", '<br />', Configuration::get('MANDATADMINISTRATIF_ACCOUNT_ADDRESS')),
            '{account_details}' => str_replace("\n", '<br />', Configuration::get('MANDATADMINISTRATIF_ACCOUNT_DETAILS')),
            '{company_address}' => str_replace("\n", '<br />', Configuration::get('MANDATADMINISTRATIF_COMPANY_ADDRESS'))
        );

        $this->module->validateOrder((int)$cart->id, Configuration::get('MANDATADMINISTRATIF_WAITING'), $total, $this->module->displayName, null, $mailVars, (int)$currency->id, false, $customer->secure_key);
        Tools::redirect('index.php?controller=order-confirmation&id_cart='.(int)$cart->id.'&id_module='.(int)$this->module->id.'&id_order='.$this->module->currentOrder.'&key='.$customer->secure_key);
    }

    protected function isValidOrder()
    {
        /**
         * Add your checks right there
         */
        return true;
    }
}
