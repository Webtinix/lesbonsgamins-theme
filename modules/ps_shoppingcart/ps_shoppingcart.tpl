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

<div id="_desktop_cart">
  <div class="group mt-2  blockcart relative cart-preview {if $cart.products_count > 0}active{else}inactive{/if}"
    data-refresh-url="{$refresh_url}">
    <a href="{$cart_url}" class="relative inline-block">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-7 md:h-8" viewBox="0 0 30.72 29.24"
        style="enable-background:new 0 0 30.72 29.24;">
        <g>
          <path fill="#00A194"
            d="M4,28.36c-0.54,0-1.03-0.2-1.4-0.58c-0.37-0.37-0.58-0.89-0.61-1.46c-0.1-2.07-0.24-3.08-0.4-4.14   c-0.15-1.04-0.31-2.12-0.41-4.25c-0.1-2.1-0.14-3.16-0.18-4.21c-0.04-1.05-0.08-2.1-0.18-4.2C0.77,8.29,1.94,7.59,3.12,7.53   c1.97-0.09,2.92-0.22,3.93-0.36c0.99-0.14,2.01-0.28,4.03-0.37c2.01-0.1,3.03-0.1,4.02-0.1c0.98,0,1.99,0,3.97-0.1   c2.01-0.1,3.01-0.15,4.01-0.2c0.99-0.05,1.99-0.1,3.97-0.2c0.57-0.03,1.11,0.15,1.52,0.51c0.42,0.36,0.66,0.88,0.69,1.46   c0.1,2.08,0.21,3.14,0.32,4.16c0.11,1.04,0.22,2.11,0.32,4.23c0.1,2.12,0.08,3.2,0.06,4.25c-0.02,1.03-0.04,2.09,0.06,4.17   c0.06,1.22-0.82,2.26-1.96,2.32l0,0c-2,0.09-2.99,0.15-3.99,0.21c-1,0.06-2,0.12-3.99,0.21c-2.01,0.1-3.04,0.09-4.03,0.09   c-0.98,0-1.99-0.01-3.97,0.09C10.1,28,9.1,28.07,8.11,28.13c-1,0.07-2,0.13-4,0.23C4.07,28.36,4.04,28.36,4,28.36z M27.17,7.35   c-0.02,0-0.04,0-0.06,0c-1.98,0.09-2.98,0.15-3.97,0.2c-1.01,0.05-2,0.1-4.02,0.2c-2.01,0.1-3.03,0.1-4.02,0.1   c-0.98,0-1.99,0-3.97,0.1C9.16,8.04,8.21,8.17,7.2,8.31C6.22,8.45,5.19,8.59,3.17,8.68C2.7,8.7,1.95,8.94,1.98,9.46   c0.1,2.1,0.14,3.16,0.18,4.21c0.04,1.05,0.08,2.1,0.18,4.2c0.1,2.07,0.24,3.08,0.4,4.14c0.15,1.04,0.31,2.12,0.41,4.25   c0.01,0.29,0.11,0.54,0.28,0.71c0.16,0.16,0.38,0.25,0.63,0.23c1.99-0.09,2.99-0.16,3.98-0.22c1-0.07,2-0.13,4-0.23   c2.01-0.1,3.03-0.09,4.03-0.09c0.98,0,1.99,0.01,3.97-0.09c1.99-0.09,2.98-0.15,3.97-0.21c1-0.06,2-0.12,4-0.21   c0.57-0.03,0.89-0.6,0.87-1.11c-0.1-2.12-0.08-3.2-0.06-4.25c0.02-1.03,0.04-2.09-0.06-4.17c-0.1-2.09-0.21-3.15-0.32-4.17   c-0.11-1.04-0.22-2.11-0.32-4.23C28.1,7.96,28,7.74,27.82,7.58C27.65,7.43,27.42,7.35,27.17,7.35z M28.03,26.73L28.03,26.73   L28.03,26.73z" />
          <path fill="#00A194"
            d="M6.45,12.76c-0.35,0-0.64-0.27-0.66-0.63C5.64,8.96,6.35,6.21,7.85,4.2C9.4,2.1,11.7,0.92,14.5,0.78   c2.81-0.14,5.65,0.84,7.8,2.66c2.29,1.94,3.63,4.69,3.77,7.72c0.02,0.36-0.26,0.67-0.63,0.69c-0.36,0.02-0.67-0.26-0.69-0.63   c-0.13-2.67-1.3-5.08-3.31-6.78c-1.9-1.61-4.4-2.46-6.89-2.35c-2.39,0.11-4.35,1.11-5.66,2.88c-1.31,1.77-1.93,4.22-1.8,7.09   c0.02,0.36-0.26,0.67-0.63,0.69C6.47,12.76,6.46,12.76,6.45,12.76z" />
        </g>
      </svg>
      {* <div class="absolute top-4 -right-2 bg-2cb1a5 inline-flex rounded-full h-4 w-4 bg-sky-500 text-xs justify-center font-medium text-white items-center"> *}
      <div
        class="absolute bottom-1 md:bottom-0 left-5 md:left-6 bg-2cb1a5 inline-flex rounded-full h-4 w-4 text-xs justify-center font-medium text-white items-center">
        <span class="text-white" style="font-size: 10px;">{$cart.products_count}</span>
      </div>
    </a>
    <div
      class="-right-2 top-14 w-96 absolute opacity-0 inivisible hidden group-hover:block group-hover:opacity-1 z-10 text-gray-500 transition-opacity duration-300 rounded shadow-md bg-fff3e8">
      <div class="hidden md:flex flex-col w-full contentpopup p-3">
        <div class="flex flex-row justify-between items-center">
          <div class="font-bold">
            <span class="text-base">Mon panier</span> - <span class="text-sm">{$cart.products_count} article(s)</span>
          </div>
          <div>
            <button type="button" class="text-lg close">
              <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 9.496 9.496">
                <g id="Groupe_2200" data-name="Groupe 2200" transform="translate(-1809.21 -301.543)">
                  <path id="Tracé_1281" data-name="Tracé 1281" d="M1813,313l8.083,7.437"
                    transform="translate(-3.083 -10.427)" fill="none" stroke="#191310" stroke-linecap="round"
                    stroke-width="1" />
                  <path id="Tracé_1282" data-name="Tracé 1282" d="M0,0,8.083,7.437"
                    transform="translate(1817.677 302.25) rotate(90)" fill="none" stroke="#191310"
                    stroke-linecap="round" stroke-width="1" />
                </g>
              </svg>
            </button>
          </div>
        </div>
        <div>
          {assign var="only_cadeau" value=false}
          {if count($cart.products) == 1}
            {assign var="is_cadeau" value=$wx_customshop->get_acf_value('carte_cadeau', $cart.products[0].id_product)}
            {if $is_cadeau == 1}
              {assign var="only_cadeau" value=true}
            {/if}
          {/if}
          {assign var="freeshipping_data_carte_rules" value=$wx_customshop->getFreeShipping()}

          {if $freeshipping_data_carte_rules|count > 0}
            {* {$freeshipping_data_carte_rules[0]|dump} *}
            {* {assign var="freeshipping" value=(49 - floatval($cart.subtotals.products.amount))} *}
            {assign var="freeshipping" value=($freeshipping_data_carte_rules[0].minimum_amount - floatval($cart.subtotals.products.amount))}
            <div class="flex w-full py-3">
              <p class="rounded py-2 px-6 w-full font-medium text-sm text-white flex items-center space-x-2"
                style="background-color:{if $freeshipping <= 0 or $only_cadeau}#02B57E{else}#ff7e1c{/if};">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="16" height="17"
                  viewBox="0 0 16 17">
                  <defs>
                    <pattern id="pattern" preserveAspectRatio="none" width="100%" height="100%" viewBox="0 0 59 58">
                      <image width="59" height="58"
                        xlink:href="data:image/png;base64,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" />
                    </pattern>
                  </defs>
                  <rect id="Cadeau-blanc_2x" data-name="Cadeau-blanc@2x" width="16" height="17" fill="url(#pattern)" />
                </svg>
                <span class="text-white">
                  {if $only_cadeau}
                    {l s='Vous bénéficiez de la livraison offerte.' d='Shop.Theme.Checkout'}
                  {else}
                    {if $freeshipping <= 0}
                      {l s='Vous bénéficiez de la livraison offerte.' d='Shop.Theme.Checkout'}
                    {else}
                      {l
                                                                                                                s='Vous êtes à [1][2][/2][/1] de la livraison offerte.'
                                                                                                                sprintf=[
                                                                                                                  '[1]' => '<span class="text-white">',
                                                                                                                  '[/1]' => ' €</span>',
                                                                                                                  '[2]' => {str_replace('.',',',number_format((float)$freeshipping, 2, '.', ''))},
                      '[/2]' => ''
                      ]
                      d='Shop.Theme.Checkout'
                      }
                    {/if}
                  {/if}
                </span>
              </p>
            </div>
          {/if}
        </div>

        <div class="flex flex-col space-y-4 rounded max-h-60 overflow-y-auto overflow-x-hidden pr-2 lbg-scrollbar">
          <ul class="bg-white px-3 pb-3 h-auto divide-y space-y-3">
            {if $cart.products|count <= 0}
              <p class="p-4">Il n'y a aucun produit dans votre panier</p>
              {else}















                {foreach from=$cart.products item=product}















                  {include 'module:ps_shoppingcart/ps_shoppingcart-product-line.tpl' product=$product}
                {/foreach}
              {/if}
            </ul>
          </div>
          <div class="flex justify-end space-x-8 py-4 text-lg font-semibold text-black">
            {* {$cart.subtotals.products|@var_dump} *}
            <span>Sous-total</span>
            <span>{$cart.subtotals.products.value}</span>
          </div>
          <style>
            .custom-link:hover {
              color: white !important;
            }
          </style>
          <div class="flex flex-row space-x-2 justify-between items-center">
            <div><a href="{$cart_url}"
                class="w-full rounded px-12 py-1.5 font-medium whitespace-nowrap bg-white hover:bg-lbg-primary custom-link"
                style="border: 1px solid #00a396; color: #00a396;">Voir panier</a></div>
            <div><a href="{$urls.pages.order}" type="button"
                class="w-full rounded px-16 py-1 text-white font-medium whitespace-nowrap bg-lbg-primary  hover:bg-primary">Payer</a>
            </div>
          </div>
        </div>
        <div class="arrow-3x ::before, ::after"></div>
      </div>
    </div>
  </div>