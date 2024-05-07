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
  {l s='Mes bons d’achat' d='Shop.Theme.Customeraccount'}
{/block}

{block name='wx_container_menu_items'}
  {* {$cart_rules|dump} *}
  {assign var="is_free_shipping" value=$wx_customshop->isFreeShippingCartRules($cart_rules)}
  {if $cart_rules && !$is_free_shipping}
    <table class="mt-14 table table-labeled hidden-xs-down">
      <thead>
        <tr>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">
            {l s='Description' d='Shop.Theme.Checkout'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">
            {l s='Statut' d='Shop.Theme.Checkout'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">
            {l s='Montant' d='Shop.Theme.Checkout'}</th>
          {* <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">
            {l s='Min. Achat' d='Shop.Theme.Checkout'}</th> *}
          <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">
            {l s='Cumulable' d='Shop.Theme.Checkout'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-l-2">
            {l s='Date d’expiration' d='Shop.Theme.Checkout'}</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$cart_rules item=cart_rule}
          {* {$cart_rule|dump} *}
          {assign var="is_not_expired" value=$wx_customshop->isDateGreaterThanToday($cart_rule.date_to)}

          {* On ne va pas afficher les carte cadeaux *}
          {assign var="is_current_free_shipping" value=$wx_customshop->isFreeShippingCartRules([$cart_rule])}
          {if !$is_current_free_shipping}
            <tr>
              <td class="border-silver-my-account-history text-left font-normal p-5 border-b-2 border-t-2 border-r-2">
                {$cart_rule.name}</td>
              <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">
                <span
                  class="p-3 rounded {if !$is_not_expired}voucher-expired{elseif !$cart_rule.quantity}voucher-used{else}voucher-valid{/if}">
                  {if !$is_not_expired}
                    {l s='Expiré' d='Shop.Theme.Checkout'}
                  {elseif !$cart_rule.quantity}
                    {assign var="order_cart_rule" value=$wx_customshop->getOrdersOfCartRule($cart_rule.id_cart_rule)}
                    {l s='Utilisé' d='Shop.Theme.Checkout'} 
                    {foreach from=$order_cart_rule item=order}
                      ({$order.id_order})
                    {/foreach}
                  {else}
                    {l s='Valide' d='Shop.Theme.Checkout'}
                  {/if}
                </span>
              </td>
              <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">
                {* {$cart_rule.voucher_minimal} *}
                {$cart_rule.value}
              </td>
              {* <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">
                {if $cart_rule.minimum_amount > 0}
                  {$cart_rule.voucher_minimal}
                {else}
                  -
                {/if}
              </td> *}
              <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">
                {$cart_rule.voucher_cumulable}</td>
              <td class="border-silver-my-account-history text-left font-normal p-5 border-b-2 border-t-2 border-l-2">
                {$cart_rule.voucher_date}</td>
            </tr>
          {/if}
        {/foreach}
      </tbody>
    </table>
    {* <div class="cart-rules mt-10 hidden-md-up"> *}
    <div class="cart-rules mt-10 hidden-md-up flex flex-col gap-4">
      {foreach from=$cart_rules item=cart_rule}
        {assign var="is_not_expired" value=$wx_customshop->isDateGreaterThanToday($cart_rule.date_to)}
        {assign var="is_current_free_shipping" value=$wx_customshop->isFreeShippingCartRules([$cart_rule])}
        {if !$is_current_free_shipping}
          <div class="cart-rule bg-gray-100 rounded-lg w-full pt-4 md:pt-3 pb-4 md:pb-6">
            <div class="px-4 md:pl-10">
              {* <div class="text-2xl pb-5 font-medium"> *}
              <div class="text-xl pb-5 font-medium">
                {* {l s='Bon d’achat' d='Shop.Theme.Checkout'} {$cart_rule.code} *}
                {$cart_rule.name} 
                {* {$cart_rule.code} *}
              </div>
              <div>
                {l s='Date d’expiration' d='Shop.Theme.Checkout'} :
                {$cart_rule.voucher_date}
              </div>
              <div>
                {l s='Cumulable' d='Shop.Theme.Checkout'} :
                {$cart_rule.voucher_cumulable}
              </div>
              <div>
                {l s='Montant' d='Shop.Theme.Checkout'} :
                {$cart_rule.value}
              </div>
              {* <div class="flex flex-col">
                <span>{l s='Montant min d’achat' d='Shop.Theme.Checkout'} : -</span>
                <span>{$cart_rule.voucher_minimal}</span>
              </div> *}
              <div>
                <span
                  class="p-3 rounded text-white {if !$is_not_expired}voucher-expired{elseif !$cart_rule.quantity}voucher-used{else}voucher-valid{/if} inline-block">
                  {if !$is_not_expired}
                    {l s='Expiré' d='Shop.Theme.Checkout'}
                  {elseif !$cart_rule.quantity}
                    {l s='Utilisé' d='Shop.Theme.Checkout'}
                  {else}
                    {l s='Valide' d='Shop.Theme.Checkout'}
                  {/if}
                </span>
              </div>
            </div>
          </div>
        {/if}
      {/foreach}
    </div>
  {else}
    <div class="p-4 border rounded">
      <p class="mb-0">{l s='Il n’y a pas de codes de rabais pour le moment.' d='Shop.Theme.Checkout'}</p>
    </div>
  {/if}
{/block}