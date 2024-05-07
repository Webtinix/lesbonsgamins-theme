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
{block name='cart_detailed_actions'}
  <div class="checkout cart-detailed-actions js-cart-detailed-actions card-block">
    {if $cart.products|count > 0}
    <p class="md:hidden text-sm border py-2 px-3 md:p-2 text-center mb-2 rounded-sm bg-white border-lbg-primary">
      {l
        s='Livraison de votre commande estimée entre %delay%.'
        sprintf=[
          '%delay%' => {$wx_customshop->wx_getGlobalDeliveryDate()}
        ]
        d='Shop.Theme.Checkout'
      }
    </p>
    <p class="hidden md:inline-block text-sm pb-2 text-center text-lbg-primary font-medium">
      {l
        s='Livraison de votre commande estimée entre %delay%.'
        sprintf=[
          '%delay%' => {$wx_customshop->wx_getGlobalDeliveryDate()}
        ]
        d='Shop.Theme.Checkout'
      }
    </p>
    {/if}
    {if $cart.minimalPurchaseRequired}
      <div class="alert alert-warning" role="alert">
        {$cart.minimalPurchaseRequired}
      </div>
      <div class="w-full">
        <button type="button" class="bg-lbg-primary  hover:bg-primary block text-white w-full p-3 text-center rounded-sm disabled" disabled>{l s='Passer ma commande' d='Shop.Theme.Actions'}</button>
      </div>
    {elseif empty($cart.products) }
      <div class="w-full">
        <button type="button" class="bg-lbg-primary  hover:bg-primary block text-white w-full p-3 text-center rounded-sm disabled" disabled>{l s='Passer ma commande' d='Shop.Theme.Actions'}</button>
      </div>
    {else}
      <div class="w-full">
        <a href="{$urls.pages.order}" class="bg-lbg-primary  hover:bg-primary block text-white w-full py-2 px-4 text-sm font-medium text-center rounded-sm">{l s='Passer ma commande' d='Shop.Theme.Actions'}</a>
        {hook h='displayExpressCheckout'}
      </div>
    {/if}
  </div>
{/block}
