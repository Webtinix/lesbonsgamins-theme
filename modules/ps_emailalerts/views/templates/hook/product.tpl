{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2015 PrestaShop SA
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

<div class="tabs mt-0 mb-4">
    <div class="wx js-mailalert"
        data-url="{url entity='module' name='ps_emailalerts' controller='actions' params=['process' => 'add']}">
        {if empty($has_notification)}
            <p>{l s='Merci de renseigner votre adresse mail afin d\'être notifié du retour de ce produit' d='Modules.Emailalerts.Shop'}
            </p>
            <div class="flex flex-col mt-2">
                <div class="mt-1">
                    <input placeholder="{l s='Adresse mail' d='Modules.Emailalerts.Shop'}" type="email"
                        name="customer_email" class="input-pop-up-avertir-by-email py-2 border-b-2 border-gray-400 w-full"
                        value="{if empty($email)}{$customer.email}{/if}" />
                </div>
            </div>
            {* {$product.id_product|@var_dump} *}
            <div class="wx-mailalert-alerts mt-4"></div>
            <button data-product="{if isset($product)}{$product.id_product}{/if}"
                data-product-attribute="{if isset($product)}{$product.id_product_attribute}{/if}"
                class="button-pop-up-avertir-by-email w-11/12 md:w-2/3 mx-auto block bg-lbg-primary text-white rounded mt-4 block text-center js-mailalert-add bg-lbg-primary hover:bg-primary py-2.5"
                rel="nofollow">
                {l s="Valider" d='Modules.Emailalerts.Shop'}
            </button>
        {else}
            <div class="pt-4 pb-3">
                <div class="flex items-center space-x-1 mb-2">
                    <span class="font-bold text-lbg-primary ">&check;</span>
                    <span class="text-lbg-primary">E-mail bien pris en compte</span>
                </div>
                <p class="font-medium">
                    {l s="Dès que le produit sera à nouveau disponible, vous recevrez un e-mail de notification de notre part." d='Modules.Emailalerts.Shop'}
                </p>
            </div>
        {/if}
    </div>
</div>