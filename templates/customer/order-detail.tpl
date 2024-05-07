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
{extends file='customer/my-account.tpl'}

{block name='wx_menu_page_title'}
  {l 
    s='Détails de ma commande N°%ref%'
    sprintf=[
    '%ref%' => $order.details.reference
  ] d='Shop.Theme.Customeraccount'}
{/block}

{block name='wx_container_menu_items'}
  {block name='order_infos'}
    <div id="order-infos">
      <div class="md:mt-7 flex justify-between">
          <div class="grid gap-y-5 md:grid-cols-2 md:gap-x-10">
            {if $order.details.invoice_url}
              <div class="inline-block">
                <a 
                href="{$order.details.invoice_url}" 
                class="inline-block w-full h-full md:w-auto py-3 px-5 cursor-pointer font-medium rounded bg-primary text-white">{l s='Télécharger ma facture' d='Shop.Theme.Customeraccount'}
                </a>
              </div>
            {/if}
            {if !$configuration.is_catalog}
              {assign var="order_slip" value=OrderSlip::getOrdersSlip($customer.id, $order.id)}
              {if count($order_slip) > 0}
              <div class="inline-block">
                <a 
                  href="{$order_slip.id_order_slip}{$link->getPageLink('pdf-order-slip', true, 1)}&id_order_slip={$order_slip[0].id_order_slip}" 
                  class="inline-block w-full h-full md:w-auto py-3 px-5 cursor-pointer font-medium rounded border-2 text-lbg-primary border-lbg-primary">{l s='Télécharger mon avoir' d='Shop.Theme.Customeraccount'}
                </a>
              </div>
              {/if}
            {/if}
          </div>
          <div>
            {if $order.details.reorder_url}
              <div class="pt-5 md:pt-0 inline-block pl-4">
                <a 
                href="{$order.details.reorder_url}" 
                class="hover:underline text-lbg-primary">{l s='Reorder' d='Shop.Theme.Actions'}</a>
              </div>
            {/if}
          </div>
      </div>
      <p class="my-7 hidden md:flex text-lg">
        <span class="font-bold">{l s='Mode de paiement' d='Shop.Theme.Checkout'} :</span> <span>{$order.details.payment}</span>
      </p>

      {* <div class="box">
          <ul>
            <li><strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$order.carrier.name}</li>
            <li><strong>{l s='Payment method' d='Shop.Theme.Checkout'}</strong> {$order.details.payment}</li>
            {if $order.details.recyclable}
              <li>
                {l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}
              </li>
            {/if}

            {if $order.details.gift_message}
              <li>{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}</li>
              <li>{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}</li>
            {/if}
          </ul>
      </div> *}
    </div>
  {/block}

  {block name='order_history'}
    <section id="order-history">
      <h3 class="text-xl mt-5 md:mt-0 mb-5 md:border-b-2 pb-2 border-silver-my-account-history">{l s='Suivre le statut de ma commande' d='Shop.Theme.Customeraccount'}</h3>
      <table class="table table-labeled hidden-xs-down">
        <thead>
          <tr>
            <th class="w-1/5 border-silver-my-account-history text-center font-normal p-2 border-r-2">{l s='Date' d='Shop.Theme.Global'}</th>
            <th class="border-silver-my-account-history text-left font-normal pl-10 p-2 border-l-2">{l s='Status' d='Shop.Theme.Global'}</th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$order.history item=state}
            <tr>
              <td class="border-silver-my-account-history font-normal p-5 border-b-2 border-t-2 border-r-2">{$state.history_date}</td>
              <td class="border-silver-my-account-history font-normal p-5 pl-10 border-b-2 border-t-2 border-l-2">
                <span class="p-3 rounded {$state.contrast}" style="background-color:{$state.color}">
                  {$state.ostate_name}
                </span>
              </td>
            </tr>
          {/foreach}
        </tbody>
      </table>
      <div class="hidden-sm-up history-lines border-b-2 border-gray-500 pb-8">
        {foreach from=$order.history item=state}
          <div class="my-5 flex justify-between items-center">
            <div class="date">{$state.history_date}</div>
            <div class="state">
              <span class="inline-block p-3 rounded text-white {$state.contrast}" style="background-color:{$state.color}">
                {$state.ostate_name}
              </span>
            </div>
          </div>
        {/foreach}
      </div>
    </section>
  {/block}

  {block name='order_carriers'}
    {if $order.shipping}
      <section>
        <h3 class="text-xl mt-14 md:mb-10 md:border-b-2 pb-2 border-silver-my-account-history">{l s='Transporteur' d='Shop.Theme.Customeraccount'}</h3>
        <table class="table table-labeled hidden-xs-down">
          <thead>
            <tr>
              <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">{l s='Date' d='Shop.Theme.Global'}</th>
              <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">{l s='Tansporteur' d='Shop.Theme.Checkout'}</th>
              <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">{l s='Poids' d='Shop.Theme.Checkout'}</th>
              <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">{l s='Frais d’expédition' d='Shop.Theme.Checkout'}</th>
              <th class="border-silver-my-account-history text-center font-normal p-2 border-l-2">{l s='Numéro de suivi' d='Shop.Theme.Checkout'}</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$order.shipping item=line}
              <tr>
                <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">{$line.shipping_date}</td>
                <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">{$line.carrier_name}</td>
                <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">{$line.shipping_weight}</td>
                <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">{$line.shipping_cost}</td>
                <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-l-2"><span class="underline text-blue-my-account-num-tracking">{$line.tracking nofilter}</span></td>
              </tr>
            {/foreach}
          </tbody>
        </table>
        <div class="hidden-md-up shipping-lines">
          {foreach from=$order.shipping item=line}
            <div class="">
              <h4 class="text-xl py-5">{$line.carrier_name}</h4>
              <div class=" py-1">{$line.shipping_date}</div>
              <div class=" py-1">{l s='Numéro de suivi' d='Shop.Theme.Customeraccount'} : <span class="underline text-blue-my-account-num-tracking">{$line.tracking nofilter}</span></div>
              <div class="flex justify-between py-1">
                <span>{$line.shipping_weight}</span>
                <span>{$line.shipping_cost}</span>
              </div>
            </div>
            {* <div class="shipping-line">
              <ul>
                <li>
                  <strong>{l s='Date' d='Shop.Theme.Global'}</strong> {$line.shipping_date}
                </li>
                <li>
                  <strong>{l s='Carrier' d='Shop.Theme.Checkout'}</strong> {$line.carrier_name}
                </li>
                <li>
                  <strong>{l s='Weight' d='Shop.Theme.Checkout'}</strong> {$line.shipping_weight}
                </li>
                <li>
                  <strong>{l s='Shipping cost' d='Shop.Theme.Checkout'}</strong> {$line.shipping_cost}
                </li>
                <li>
                  <strong>{l s='Tracking number' d='Shop.Theme.Checkout'}</strong> {$line.tracking nofilter}
                </li>
              </ul>
            </div> *}
          {/foreach}
        </div>
      </section>
    {/if}
  {/block}
  
  {block name='order_detail'}
    {if $order.details.is_returnable}
      {include file='customer/_partials/order-detail-return.tpl'}
    {else}
      {include file='customer/_partials/order-detail-no-return.tpl'}
    {/if}
  {/block}
  
  {* {if $order.follow_up}
    <div class="box">
      <p>{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</p>
      <a href="{$order.follow_up}">{$order.follow_up}</a>
    </div>
  {/if} *}

  {block name='addresses'}
    <div class="addresses flex flex-col md:flex-row md:justify-between">
      {if $order.addresses.delivery}
        <div class="md:mx-2 w-full md:w-5/12 py-10 md:py-0 md:pb-2">
          <article id="delivery-address">
            <h4 class="text-2xl font-medium md:font-normal md:border-b-2 md:border-gray-500">{l s='Adresse de livraison' d='Shop.Theme.Checkout'}</h4>
            <div class="flex flex-col pt-5">
              <span class="text-2xl">{$order.addresses.delivery.alias}</span>
              <span class="text-sm">{$order.addresses.delivery.firstname} {$order.addresses.delivery.lastname}</span>
              <span class="text-sm">{$order.addresses.delivery.address1}</span>
              <span class="text-sm">{$order.addresses.delivery.address2}</span>
              <span class="text-sm">{$order.addresses.delivery.postcode} {$order.addresses.delivery.city} - {Country::getNameById($language['id'], $order.addresses.delivery.id_country)}</span>
              <span class="text-sm">{$order.addresses.delivery.phone}</span>
              <span class="text-sm">{$order.addresses.delivery.phone_mobile}</span>
            </div>
          </article>
        </div>
      {/if}

      <div class="md:ml-2 w-full md:w-5/12 border-t-2 border-gray-500 md:border-0 py-10 md:py-0 md:pb-2">
        <article id="invoice-address">
          <h4 class="text-2xl font-medium md:font-normal md:border-b-2 md:border-gray-500">{l s='Adresse de facturation' d='Shop.Theme.Checkout'}</h4>
          <div class="flex flex-col pt-5">
            <span class="text-2xl">{$order.addresses.invoice.alias}</span>
            <span class="text-sm">{$order.addresses.invoice.firstname} {$order.addresses.invoice.lastname}</span>
            <span class="text-sm">{$order.addresses.invoice.address1}</span>
            <span class="text-sm">{$order.addresses.invoice.address2}</span>
            <span class="text-sm">{$order.addresses.invoice.postcode} {$order.addresses.invoice.city} - {Country::getNameById($language['id'], $order.addresses.invoice.id_country)}</span>
            <span class="text-sm">{$order.addresses.invoice.phone}</span>
            <span class="text-sm">{$order.addresses.invoice.phone_mobile}</span>
          </div>
        </article>
      </div>
    </div>
  {/block}

  {$HOOK_DISPLAYORDERDETAIL nofilter}



  {* {block name='order_messages'}
    {include file='customer/_partials/order-messages.tpl'}
  {/block} *}
{/block}
