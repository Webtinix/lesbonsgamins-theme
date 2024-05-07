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

{block name='content'}

  <section id="main" style="max-width: 85rem;" class="mx-auto px-4 md:min-h-screen cart-container">
    <div class="cart-grid flex flex-col md:flex-row gap-4 md:gap-16 -mt-5 md:mt-0">

      <!-- Left Block: cart product informations & shpping -->
      <div class="lg:w-7/12">

        <!-- cart products detailed -->
        <div class="mt-4 md:mt-0">
          <div class="border-b-2 py-4 border-gray-400">
            <h1 class="text-3xl font-bold">{l s='Mon panier' d='Shop.Theme.Checkout'}</h1>
          </div>
          {block name='cart_overview'}
            {include file='checkout/_partials/cart-detailed.tpl' cart=$cart}
          {/block}
        </div>

        <!-- shipping informations -->
        {block name='hook_shopping_cart_footer'}
          {hook h='displayShoppingCartFooter'}
        {/block}

      </div>

      <!-- Right Block: cart subtotal & cart total -->
      <div class="lg:w-5/12 relative md:max-w-lg -mx-4 md:mx-auto" {*x-data="{ isScrolledIntoView: false }" x-init="window.addEventListener('scroll', () => { isScrolledIntoView = window.scrollY > (document.querySelector('#footer').offsetTop - 900) })"*}>
        <div id="cartSummary" {*:class="{ 'lg:fixed': !isScrolledIntoView }"*} class="md:w-512 lg:fixed">
          <div class="px-6 pt-7 bg-gray-100 rounded-md">
            {block name='cart_header'}
              <p class="text-2xl font-medium mb-8">Récapitulatif de la commande</p>  
            {/block}

            {block name='cart_summary'}
              <div class="cart-summary w-full">
                {block name='cart_totals'}
                  {include file='checkout/_partials/cart-detailed-totals.tpl' cart=$cart}
                {/block}
              </div>

              <div class="flex space-x-3 pb-6">
                <div>
                  <img 
                    class="h-4"
                    src="{$urls.img_url}payment-methods/payplug.png" 
                    title="Paiement par payplug"
                    alt="Paiement par payplug"
                  />
                </div>
                <div>
                  <img 
                    class="h-4"
                    src="{$urls.img_url}payment-methods/paypal.png" 
                    title="Paiement par paypal"
                    alt="Paiement par paypal"
                  />
                </div>
                <div>
                  <img 
                    class="h-4"
                    src="{$urls.img_url}payment-methods/ps_wirepayment.png" 
                    title="Paiement par transfert bancaire"
                    alt="Paiement par transfert bancaire"
                  />
                </div>
                <div>
                  <img 
                    class="h-4"
                    src="{$urls.img_url}payment-methods/mandatadministratif.png" 
                    title="Paiement par mandat administratif"
                    alt="Paiement par mandat administratif"
                  />
                </div>
              </div>

              <div class="">
                {block name='cart_actions'}
                  {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
                {/block}
              </div>
            {/block}
          </div>

          <div class="bg-gray-100 px-6 py-2 mt-4 rounded-md">
            {block name='hook_reassurance'}
              {hook h='displayReassurance'}
            {/block}
          </div>
        </div>
      </div>
    </div>
    <div class="lg:w-7/12 mb-10">
      {assign var="wishlish_products" value=$favoris_controller->getMyWishlist()}
      {if not empty($wishlish_products)}
      <div class="w-full relative md:py-5">
        <h2 class="text-3xl font-bold py-4 lg:px-0 border-b-2 border-gray-400">{l s= 'Mes produits favoris' d='Shop.Theme.Checkout'}</h2>
        <div class="products products-grid w-full grid grid-cols-2 gap-2 md:gap-4" id="wishlistContainer">
          {foreach from=$wishlish_products item="product" key="position"}
            {if $position <= 3}
            {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position productClasses=""}
            {/if}
          {/foreach}
        </div>
        <div class="w-full flex justify-center mt-4">
          <a href="{$link->getModuleLink('blockwishlist', 'lists')|escape:'html':'UTF-8'}" class="w-full flex items-center justify-center space-x-6 border-2 border-lbg-primary py-3 px-12 rounded">
            <span class="text-lbg-primary">Voir tous mes favoris</span>
            <img
              class="h-5" 
              src="{$urls.img_url}Coeur-bleu@2x.png"
              alt="Coeur Vert"
              title="Coeur Vert"
            />
          </a>
        </div>
      </div>
      {/if}
    </div>
  </section>

  {* {block name='hook_shopping_cart'}
    {hook h='displayShoppingCart'}
  {/block} *}

  {* {block name='cart_actions'}
    {include file='checkout/_partials/cart-detailed-actions.tpl' cart=$cart}
  {/block} *}
{/block}
