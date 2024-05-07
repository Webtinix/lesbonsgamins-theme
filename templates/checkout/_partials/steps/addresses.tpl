{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div class="md:border-b pb-4 mb-2 md:mb-6 border-gray-400">
    <h1 class="text-3xl md:text-4xl font-bold">{l s='Mes informations' d='Shop.Theme.Checkout'}</h1>
  </div>
    
  <div class="js-address-form">
    <form
      method="POST"
      action="{url entity='order' params=['id_address' => $id_address]}"
      data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}"
    >
      {if $show_delivery_address_form}
        {if isset($smarty.get.newAddress) && $smarty.get.newAddress === "delivery"}
          <h2 class="font-medium text-2xl">Mon adresse de livraison</h2>
        {/if}
        <div id="delivery-address" class="mt-5">
          {render file                      = 'checkout/_partials/address-form.tpl'
            ui                        = $address_form
            use_same_address          = $use_same_address
            type                      = "delivery"
            form_has_continue_button  = $form_has_continue_button
          }
        </div>
      {elseif $customer.addresses|count > 0}
        <div class="">
          <p class="text-xl md:text-2xl font-medium">{l s='Shipping Address' d='Shop.Theme.Checkout'}</p>
        </div>
        <div id="delivery-addresses" class="address-selector js-address-selector">
          {include  file        = 'checkout/_partials/address-selector-block.tpl'
            addresses   = $customer.addresses
            name        = "id_address_delivery"
            selected    = $id_address_delivery
            type        = "delivery"
            interactive = !$show_delivery_address_form and !$show_invoice_address_form
          }
        </div>

        {if isset($delivery_address_error)}
          <p class="alert alert-danger js-address-error" name="alert-delivery" id="id-failure-address-{$delivery_address_error.id_address}">{$delivery_address_error.exception}</p>
        {else}
          <p class="alert alert-danger js-address-error" name="alert-delivery" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
        {/if}

        <p class="add-address px-6 py-1.5 border border-gray-400 rounded-sm">
          <a href="{$new_address_delivery_url}" class="text-sm flex items-center space-x-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 14 14">
              <g id="Groupe_2835" data-name="Groupe 2835" transform="translate(-1475.749 -560.5)">
                <path id="Tracé_1487" data-name="Tracé 1487" d="M-7365-13073.5v12" transform="translate(8847.75 13635)" fill="none" stroke="#191310" stroke-linecap="round" stroke-width="2"/>
                <path id="Tracé_1488" data-name="Tracé 1488" d="M0,0V12" transform="translate(1488.75 567.5) rotate(90)" fill="none" stroke="#191310" stroke-linecap="round" stroke-width="2"/>
              </g>
            </svg>         
            <span>{l s='Ajouter une adresse' d='Shop.Theme.Actions'}</span>
          </a>
        </p>
      {/if}

      {if !$show_delivery_address_form}
      <div class="mt-6">
        <p class="text-xl md:text-2xl font-medium mb-6">{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</p>

        {if $use_same_address && !$cart.is_virtual}
          <p>
            <a data-link-action="different-invoice-address" href="{$use_different_address_url}" class="flex items-center space-x-2">   
              <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22">
                <g id="Groupe_2830" data-name="Groupe 2830" transform="translate(-138 -419)">
                  <g id="Rectangle_1881" data-name="Rectangle 1881" transform="translate(138 419)" fill="#fff" stroke="#00a396" stroke-width="1">
                    <rect width="22" height="22" rx="3" stroke="none"/>
                    <rect x="0.5" y="0.5" width="21" height="21" rx="2.5" fill="none"/>
                  </g>
                  <path id="Tracé_1492" data-name="Tracé 1492" d="M-2736-13042.99l4.3,5.908,3.759-10.418" transform="translate(2881 13472.75)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
                </g>
              </svg>                  
              <span>{l s='Adresse de livraison et adresse de facturation identiques' d='Shop.Theme.Checkout'}</span>
            </a>
          </p>
        {else}
          <p>
            <a data-link-action="different-invoice-address" href="{$use_different_address_url}" class="flex items-center space-x-2">
              <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 22 22">
                <g id="Groupe_2830" data-name="Groupe 2830" transform="translate(-138 -419)">
                  <g id="Rectangle_1881" data-name="Rectangle 1881" transform="translate(138 419)" fill="#fff" stroke="#191310" stroke-width="1">
                    <rect width="22" height="22" rx="3" stroke="none"/>
                    <rect x="0.5" y="0.5" width="21" height="21" rx="2.5" fill="none"/>
                  </g>
                </g>
              </svg>  
              <span>{l s='Adresse de livraison et adresse de facturation identiques' d='Shop.Theme.Checkout'}</span>
            </a>
          </p>
        {/if}

        {if !$use_same_address}
          {if $show_invoice_address_form}
            <div id="invoice-address">
              {render file                      = 'checkout/_partials/address-form.tpl'
                ui                        = $address_form
                use_same_address          = $use_same_address
                type                      = "invoice"
                form_has_continue_button  = $form_has_continue_button
              }
            </div>
          {else}
            <div id="invoice-addresses" class="address-selector js-address-selector">
              {include  file        = 'checkout/_partials/address-selector-block.tpl'
                addresses   = $customer.addresses
                name        = "id_address_invoice"
                selected    = $id_address_invoice
                type        = "invoice"
                interactive = !$show_delivery_address_form and !$show_invoice_address_form
              }
            </div>

            {if isset($invoice_address_error)}
              <p class="alert alert-danger js-address-error" name="alert-invoice" id="id-failure-address-{$invoice_address_error.id_address}">{$invoice_address_error.exception}</p>
            {else}
              <p class="alert alert-danger js-address-error" name="alert-invoice" style="display: none">{l s="Your address is incomplete, please update it." d="Shop.Notifications.Error"}</p>
            {/if}

            <p class="add-address px-6 py-1.5 border border-gray-400 rounded-sm">
              <a href="{$new_address_invoice_url}" class="text-sm flex items-center space-x-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 14 14">
                  <g id="Groupe_2835" data-name="Groupe 2835" transform="translate(-1475.749 -560.5)">
                    <path id="Tracé_1487" data-name="Tracé 1487" d="M-7365-13073.5v12" transform="translate(8847.75 13635)" fill="none" stroke="#191310" stroke-linecap="round" stroke-width="2"/>
                    <path id="Tracé_1488" data-name="Tracé 1488" d="M0,0V12" transform="translate(1488.75 567.5) rotate(90)" fill="none" stroke="#191310" stroke-linecap="round" stroke-width="2"/>
                  </g>
                </svg>         
                <span>{l s='Ajouter une adresse' d='Shop.Theme.Actions'}</span>
              </a>
            </p>
          {/if}

        {/if}
      </div>
      {/if}

      {if !$form_has_continue_button}
        <div class="clearfix">
          <button type="submit" class="continue bg-lbg-primary hover:bg-primary text-white px-4 py-3 md:py-2 w-full lg:w-1/2 rounded-sm mt-6 text-sm" name="confirm-addresses" value="1">
            {l s='Continuer vers le mode de livraison' d='Shop.Theme.Actions'}
          </button>
          <input type="hidden" id="not-valid-addresses" class="js-not-valid-addresses" value="{$not_valid_addresses}">
        </div>
      {/if}

    </form>
  </div>
{/block}
