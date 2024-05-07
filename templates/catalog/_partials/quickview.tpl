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
<div id="quickview-modal-{$product.id}-{$product.id_product_attribute}" class="modal fade quickview in" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered w-full mx-auto max-w-7xl" role="document">
   <div class="modal-content w-full relative">
    <button type="button" class="close absolute top-2 right-2" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
      <span aria-hidden="true">
        <svg xmlns="http://www.w3.org/2000/svg" class="close-icon w-6 h-8 sm:w-4 sm:h-6"  viewBox="0 0 23.928 32.219">
          <g id="Groupe_2742" data-name="Groupe 2742" transform="translate(-1694.653 -667.789)">
              <path id="Tracé_1464" data-name="Tracé 1464" d="M0,0,15.956,26.441" transform="matrix(0.995, -0.105, 0.105, 0.995, 1697.301, 671.584)" fill="#00A193" stroke="#00A193" stroke-linecap="round" stroke-width="2"/>
              <path id="Tracé_1465" data-name="Tracé 1465" d="M15.956,0,0,26.441" transform="translate(1701.308 669.398) rotate(11)" fill="#00A193" stroke="#00A193" stroke-linecap="round" stroke-width="2"/>
          </g>
        </svg>
      </span>
    </button>
     <div class="modal-body mt-3">
      <div class="w-full">
        <div class="col-md-6 col-sm-6 hidden-xs-down">
          {block name='product_cover_thumbnails'}
            {include file='catalog/_partials/product-cover-thumbnails.tpl'}
          {/block}
        </div>
        <div class="col-md-6 col-sm-6">
          {if $product.id_manufacturer && Manufacturer::getNameById((int) $product.id_manufacturer)}
            <h2>
              <a href="{$link->getmanufacturerLink($product.id_manufacturer)}" class="text-base font-medium manufacturer">
                  {Manufacturer::getNameById((int) $product.id_manufacturer)}
              </a>
            </h2>
          {/if}
          {assign var='h1_text' value=$wx_customshop->get_acf_value('h_1', $product.id_product)}
          {assign var="tarif_degressif" value=$wx_customshop->get_acf_value('tarif_degressif', $product.id_product)}
          <h1 class="font-bold text-2xl">{if $h1_text != ""}{$h1_text}{else}{$product.name}{/if}</h1>
          <a href="{$product.url}" class="underline block text-lbg-primary text-sm">Voir la fiche produit</a> 
          {block name='product_prices'}
            <div class="mt-4 mb-2">
              {include file='catalog/_partials/product-prices.tpl'}
            </div>
          {/block}
          {block name='product_buy'}
            <div class="product-actions js-product-actions">
              <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                <input type="hidden" name="token" value="{$static_token}">
                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                <input type="hidden" name="id_customization" value="{$product.id_customization}"
                  id="product_customization_id" class="js-product-customization-id"
                />
                <div x-data="{ modalIsOpen: false }">
                    {block name='waitinglist_modal'}
                        {include file='catalog/_partials/waintinglist-modal.tpl'}
                    {/block}
                    {block name='product_variants'}
                        {include file='catalog/_partials/product-variants.tpl'}
                    {/block}
                    {block name='product_add_to_cart'}
                        {include file='catalog/_partials/product-add-to-cart.tpl' is_quickview=true}
                    {/block}
                </div>
                {block name='product_refresh'}{/block}
              </form>
            </div>
          {/block}
        </div>
      </div>
     </div>
     {hook h='displayCartModalFooter' product=$product}
   </div>
 </div>
</div>
