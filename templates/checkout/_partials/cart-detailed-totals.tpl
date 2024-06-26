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
{block name='cart_detailed_totals'}
<div class="cart-detailed-totals js-cart-detailed-totals w-full">

  <div class="card-block cart-detailed-subtotals js-cart-detailed-subtotals text-sm">
    {foreach from=$cart.subtotals item="subtotal"}
      {if $subtotal}
        {if $subtotal.type == "products"}
        <div class="flex justify-between mb-4">
          <span class="label text-sm">{$subtotal.label}</span>
          <span class="value text-sm">{$subtotal.value}</span>
        </div>
        {elseif $subtotal.type == "shipping"}
          <div class="flex justify-between mb-4">
            <div class="">
              <div class="flex space-x-1">
                <span class="block label text-sm font-medium">{l s='Frais de livraison' d='Shop.Theme.Checkout'}</span>           
              </div>
              <span class="block text-xs">
                {assign var="freeshipping" value=(49 - floatval($cart.subtotals.products.amount))}
                {if $freeshipping <= 0 OR $subtotal.value == 'offerte'}
                  {l s='Livraison standard (hors Chronopost)' d='Shop.Theme.Checkout'}
                {else}
                  {l
                    s='Il vous reste %freeShipping% %currency% pour la livraison offerte .'
                    sprintf=[
                      '%freeShipping%' => {str_replace('.',',',number_format((float)$freeshipping, 2, '.', ''))},
                      '%currency%' => '€'
                    ]
                    d='Shop.Theme.Checkout'
                  }
                {/if}
              </span>
            </div>
            <span class="value text-sm">{if $subtotal.value == 'offerte'}Gratuit{else}{$subtotal.value}{/if}</span>
          </div>
        {/if}
      {/if}
    {/foreach}

    {block name='cart_voucher'}
      {include file='checkout/_partials/cart-voucher.tpl'}
    {/block}

    {foreach from=$cart.subtotals item="subtotal"}
      {if $subtotal}
        {if $subtotal.type == "tax"}
          <div class="flex justify-between mt-4">
            <span class="label text-sm underline">{l s='Dont TVA' d='Shop.Theme.Checkout'}</span>
            <span class="value text-sm">{$subtotal.value}</span>
          </div>
        {/if}
      {/if}
    {/foreach}

    {assign var="ecotaxt_arr" value=[]}
    {foreach $cart.products as $product}
      {assign var="nul" value=array_push($ecotaxt_arr, $product.ecotax['amount'])}
    {/foreach}
    {assign var="cart_ecotax" value=array_sum($ecotaxt_arr)}
    {if $cart_ecotax}
      <div class="flex justify-between mt-2">
        <span class="label text-sm underline">{l s='Dont éco-participation' d='Shop.Theme.Checkout'}</span>
        <span class="value text-sm">{str_replace('.',',',number_format((float)$cart_ecotax, 2, '.', ''))} {$currency.sign}</span>
      </div>
    {/if}
  </div>


  {* {if $subtotal && $subtotal.value|count_characters > 0 && $subtotal.type !== 'tax'}
    <div class="cart-summary-line" id="cart-subtotal-{$subtotal.type}">
      <span class="label{if 'products' === $subtotal.type} js-subtotal{/if}">
        {if 'products' == $subtotal.type}
          {$cart.summary_string}
        {else}
          {$subtotal.label}
        {/if}
      </span>
      <span class="value">
        {if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}
      </span>
      {if $subtotal.type === 'shipping'}
          <div><small class="value">{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}</small></div>
      {/if}
    </div>
  {/if} *}

  {* {block name='cart_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block} *}

  {* {block name='cart_summary_tax'}
    {if $cart.subtotals.tax}
      <div class="cart-summary-line">
        <span class="label sub">{l s='%label%:' sprintf=['%label%' => $cart.subtotals.tax.label] d='Shop.Theme.Global'}</span>
        <span class="value sub">{$cart.subtotals.tax.value}</span>
      </div>
    {/if}
  {/block} *}

  {block name='cart_summary_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}

</div>
{/block}
