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
{if $cart.vouchers.allowed}
  {block name='cart_voucher'}
    <div class="block-promo">
      <div class="cart-voucher js-cart-voucher">
        {* {if $cart.vouchers.added}
          {block name='cart_voucher_list'}
            <ul class="promo-name card-block">
              {foreach from=$cart.vouchers.added item=voucher}
                <li class="cart-summary-line">
                  <span class="label">{$voucher.name}</span>
                  <div class="float-xs-right">
                    <span>{$voucher.reduction_formatted}</span>
                      {if isset($voucher.code) && $voucher.code !== ''}
                        <a href="{$voucher.delete_url}" data-link-action="remove-voucher"><i class="material-icons">&#xE872;</i></a>
                      {/if}
                  </div>
                </li>
              {/foreach}
            </ul>
          {/block}
        {/if} *}
        <div class="w-full" x-data="{ showVoucherForm: false }">
          <button @click="showVoucherForm = !showVoucherForm" class="w-full md:w-80 flex justify-between items-center">
            <span>{l s='Utiliser un code promo / carte cadeau' d='Shop.Theme.Checkout'}</span>
            <span>
              <svg x-show="showVoucherForm" x-cloak xmlns="http://www.w3.org/2000/svg" width="14.382" height="11.254" viewBox="0 0 14.382 11.254">
                <path id="Tracé_1497" data-name="Tracé 1497" d="M349.333,18.667l5.3-7.667,4.922,7.667" transform="translate(-347.246 -9.5)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
              </svg>
              <svg class="transform rotate-180" x-show="!showVoucherForm" x-cloak xmlns="http://www.w3.org/2000/svg" width="14.382" height="11.254" viewBox="0 0 14.382 11.254">
                <path id="Tracé_1497" data-name="Tracé 1497" d="M349.333,18.667l5.3-7.667,4.922,7.667" transform="translate(-347.246 -9.5)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
              </svg>
            </span>
          </button>
          {block name='cart_voucher_form'}
            <form action="{$urls.pages.cart}" data-link-action="add-voucher" method="post" class="mt-1" x-show="showVoucherForm" x-cloak>
              <input type="hidden" name="token" value="{$static_token}">
              <input type="hidden" name="addDiscount" value="1">
              <div class="flex">
                <input class="border-2 rounded-l px-2 py-1 w-full border-lbg-primary" type="text" name="discount_name" />
                <button type="submit" class="bg-lbg-primary rounded-r text-white text-sm py-2 px-5 md:px-8">{l s='Add' d='Shop.Theme.Actions'}</button>
              </div>
              <div id="error"></div>
            </form>
          {/block}
        </div>
        <div class="flex flex-wrap gap-2 mt-2">
          {foreach from=$cart.vouchers.added item=voucher}
            {if !$voucher.free_shipping}
              <div class="flex items-center gap-2 border-2 px-2 border-gray-400">
                <span class="text-sm font-medium">{$voucher.name}</span>
                <a href="{$voucher.delete_url}" class="text-lg" data-link-action="remove-voucher">&times;</a>
              </div>
            {/if}
          {/foreach}
        </div>

        {if $cart.discounts|count > 0}
          <p class="block-promo promo-highlighted">
            {l s='Take advantage of our exclusive offers:' d='Shop.Theme.Actions'}
          </p>
          <ul class="js-discount card-block promo-discounts">
            {foreach from=$cart.discounts item=discount}
              <li class="cart-summary-line">
                <span class="label">
                  <span class="code">{$discount.code}</span> - {$discount.name}
                </span>
              </li>
            {/foreach}
          </ul>
        {/if}
      </div>
    </div>
  {/block}
{/if}
