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
{block name='cart_detailed_product'}
  <div class="cart-overview js-cart" data-refresh-url="{url entity='cart' params=['ajax' => true, 'action' => 'refresh']}">
    {if $cart.products}
    <ul class="grid grid-cols-1 divide-y divide-gray-400 md:pl-6">
      {foreach from=$cart.products item=product}
        <li class="pt-6 pb-2 md:py-6">
          <div class="mb-2 flex flex-col md:flex-row justify-between md:space-x-10 md:pr-10">
            {block name='cart_detailed_product_line'}
              {include file='checkout/_partials/cart-detailed-product-line.tpl' product=$product}
            {/block}
          </div>
          <p class="md:ml-16 md:pl-4 text-base md:text-sm">
            {l
              s='Livraison de votre commande estimée entre %delay%.'
              sprintf=[
                '%delay%' => {$wx_customshop->wx_getDeliveryDate(null, $product, false)}
              ]
              d='Shop.Theme.Checkout'
            }
          </p>
        </li>
      {/foreach}
    </ul>
    {else}
      <div class="my-4">
        <span class="no-items">{l s='There are no more items in your cart' d='Shop.Theme.Checkout'}</span>
      </div>
    {/if}
  </div>
{/block}
