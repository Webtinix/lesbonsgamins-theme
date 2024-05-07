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
<section id="js-checkout-summary" class="card js-cart md:w-512 transition-all md:fixed" data-refresh-url="{$urls.pages.cart}?ajax=1&action=refresh">
  {* <div class="card-block">
    {block name='hook_checkout_summary_top'}
      {include file='checkout/_partials/cart-summary-top.tpl' cart=$cart}
    {/block}

    {block name='cart_summary_products'}
      {include file='checkout/_partials/cart-summary-products.tpl' cart=$cart}
    {/block}

    {block name='cart_summary_subtotals'}
      {include file='checkout/_partials/cart-summary-subtotals.tpl' cart=$cart}
    {/block}
  </div>

  {block name='cart_summary_totals'}
    {include file='checkout/_partials/cart-summary-totals.tpl' cart=$cart}
  {/block}

  {block name='cart_summary_voucher'}
    {include file='checkout/_partials/cart-voucher.tpl'}
  {/block} *}

  <div class="px-6 pt-7 bg-gray-100 rounded-md">
    {block name='cart_header'}
      <p class="text-2xl font-medium mb-8">Récapitulatif de la commande</p>  
    {/block}

    {block name='cart_summary'}
      <div class="cart-summary w-full pb-6">
        {block name='cart_totals'}
          {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
        {/block}
      </div>
    {/block}
  </div>

  <div class="bg-gray-100 px-6 py-2 mt-4 rounded-md">
    {block name='hook_reassurance'}
      {hook h='displayReassurance'}
    {/block}
  </div>

</section>
