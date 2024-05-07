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
{extends file=$layout}

{block name='header'}
  {include file='checkout/_partials/header.tpl'}
{/block}

{block name='content'}
  <section id="content" class="-mt-12 md:-mt-6 mx-auto px-4 md:min-h-screen" style="max-width: 85rem;">
    <div class="flex flex-col md:flex-row md:gap-16">
      <div class="cart-grid-body lg:w-7/12">
        {block name='checkout_process'}
          {render file='checkout/checkout-process.tpl' ui=$checkout_process}
        {/block}
      </div>
      <div class="cart-grid-right lg:w-5/12 relative md:max-w-lg -mx-4 md:mx-auto transition-all">
        {block name='cart_summary'}
          {include file='checkout/_partials/cart-summary.tpl' cart=$cart}
        {/block}
        {* <div id="cartSummary" class="md:w-512 transition-all fixed">
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
        </div> *}
      </div>
    </div>
  </section>
{/block}

{block name='footer'}
  {include file='checkout/_partials/footer.tpl'}
{/block}
