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

{assign var="tarif_degressif" value=$wx_customshop->get_acf_value('tarif_degressif', $product.id_product)}
{assign var="etiquette" value=$wx_customshop->get_acf_value('Etiquette', $product.id_product)}
{assign var="etiquette_arr" value=explode('|', $etiquette)}

{assign var="made_in_france" value=$wx_customshop->get_acf_value('MADE_IN_FRANCE', $product.id_product)}

{assign var="is_cadeau" value=$wx_customshop->get_acf_value('carte_cadeau', $product.id_product)}
{* {assign var="is_in_wishlist" value=$wx_customshop->isInWishlist($product.id_product)} *}
{assign var="stock_fournisseur" value=$wx_customshop->get_acf_value('stock_fournisseur', $product.id_product)}
{assign var="reapro" value=$wx_customshop->get_acf_value('REAPRO', $product.id_product)}
{* La variable relative_qty_product représente la quantité du produit courant en suivant l'utilisateur courant *}
{* Exemple, si je mets un produit au panier dont la quantité restante est de 1, si je n'ai pas encore terminé la commande,
La quantité restante est de 0 pour moi, mais un autre utilisateur a encore la possibilité de mettre le produit au panier
Donc il y a la quantité relative du produit et sa quantité absolue sur le site *}
{assign var="relative_qty_product" value=Product::getQuantity($product.id_product) scope='global'}
{if !$product.add_to_cart_url}
  {assign var="relative_qty_product" value=0 scope='global'}
{/if}
{assign var="state_stock" value='' scope='global'}
{if ($relative_qty_product > 0 && $is_cadeau != 1)}
  {assign var="state_stock" value='in_stock'}
{elseif ($relative_qty_product <= 0 && $reapro == 1 && $stock_fournisseur > 0)}
  {assign var="state_stock" value='coming_soon'}
{elseif ($relative_qty_product <= 0 && $reapro == 1 && $stock_fournisseur <= 0 && $product.available_date != '0000-00-00' && $wx_customshop->compareDate('', $product.available_date) < 0)}
  {assign var="state_stock" value='coming_soon'}
{elseif ($relative_qty_product <= 0 && $reapro == 1 && $stock_fournisseur <= 0 && ($product.available_date == '0000-00-00' || $wx_customshop->compareDate('', $product.available_date) > 0))}
  {assign var="state_stock" value='out_of_stock_with_alert'}
{elseif ($relative_qty_product <= 0 && $reapro != 1)}
  {assign var="state_stock" value='out_of_stock'}
{/if}

{* {$product.main_variants|@var_dump} *}

{block name='product_miniature_item'}
  <div class="h-full js-product product" x-data="{ modalIsOpen: false }">
    <article
      class="relative w-full bg-white px-2 py-4 md:p-4 rounded-sm h-full flex flex-col product-miniature js-product-miniature"
      data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
      {block name='made_in_france'}
        {if $made_in_france === "1"}

          {* hopcy: 08/02/2024 *}
          <svg xmlns="http://www.w3.org/2000/svg" class="drapeau absolute top-4 right-4 z-20" width="35" viewBox="0 0 46 31">
            <path id="Rectangle_1664" data-name="Rectangle 1664"
              d="M3,0H15a0,0,0,0,1,0,0V31a0,0,0,0,1,0,0H3a3,3,0,0,1-3-3V3A3,3,0,0,1,3,0Z" fill="#002654" />
            <rect id="Rectangle_1665" data-name="Rectangle 1665" width="16" height="31" transform="translate(15)"
              fill="#fff" />
            <path id="Rectangle_1666" data-name="Rectangle 1666"
              d="M0,0H12a3,3,0,0,1,3,3V28a3,3,0,0,1-3,3H0a0,0,0,0,1,0,0V0A0,0,0,0,1,0,0Z" transform="translate(31)"
              fill="#ed2939" />
          </svg>
          <small class="infobule hidden absolute text-[12px]  shadow-sm p-1 px-2 rounded-sm z-20"
            style="right: 3.3rem; top:13px;">Fabriqué en France</small>
          <style>
            @media screen and (max-width: 768px) {
              .infobule {
                display: none;

              }

              .drapeau {
                top: 0px;
                right: 0px;
                width: 25px;
              }

            }
          </style>
        {/if}
      {/block}
      {block name='flags'}
        {if $product.has_discount && $product.discount_type === 'percentage'}
          <div class="absolute z-10 left-4 top-5 w-5 text-reded -rotate-12">
            <div class="text-xl text-red-600 -mb-4 transform -rotate-12 font-bold">{$product.discount_percentage}</div>
            <img src="{$urls.img_url}Picto-carte-fiche-produit/Barre-chiffre-promotion.png"
              alt="Picto Barre-chiffre-promotion" title="Picto Barre-chiffre-promotion"
              class="brightness-95 w-16 max-w-[none]" />
          </div>
        {else}
          {foreach from=$product.flags item=flag}
            {if $flag.type === "new"}
              <div class="absolute z-10 left-4 top-5 -rotate-12">
                <img src="{$urls.img_url}Picto-carte-fiche-produit/Nouveau-produit.png" alt="Picto Nouveau-produit"
                  title="Picto Nouveau-produit" class="w-auto h-14" />
              </div>
            {/if}
          {/foreach}
        {/if}
      {/block}
      <div class="relative h-40 lg:h-72 {*thumbnail-container*}">
        {block name='product_thumbnail'}
          {assign var="hasSecondImage" value=false}
          {if $product.images && $product.images|@count > 1}
            {assign var="hasSecondImage" value=true}
          {/if}
          {if $product.cover}
            <a href="{$product.url}"
              class="{if $hasSecondImage}group{/if} w-full overflow-hidden h-full bg-white relative flex justify-center items-center">
              <img class="object-contain h-full object-center {if $hasSecondImage}inline-block group-hover:hidden{/if}"
                src="{$product.cover.bySize.home_default.url}"
                alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                title="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                loading="lazy" data-full-size-image-url="{$product.cover.large.url}"
                width="{$product.cover.bySize.home_default.width}" height="{$product.cover.bySize.home_default.height}" />
              {if $hasSecondImage}
                <img class="object-contain h-full object-center hidden group-hover:inline-block"
                  src="{$product.images[1]["bySize"]["home_default"]["url"]}"
                  alt="{if !empty($product.images[1]["legend"])}{$product.images[1]["legend"]}{else}{$product.name|truncate:30:'...'}{/if}"
                  title="{if !empty($product.images[1]["legend"])}{$product.images[1]["legend"]}{else}{$product.name|truncate:30:'...'}{/if}"
                  loading="lazy" data-full-size-image-url="{$product.images[1].large["url"]}"
                  width="{$product.images[1]["bySize"]["home_default"]["width"]}"
                  height="{$product.images[1]["bySize"]["home_default"]["height"]}" />
              {/if}
              {* {$product.images[0]|@var_dump} *}
            </a>
          {else}
            <a href="{$product.url}" class="w-full overflow-hidden h-full bg-white relative flex justify-center items-center">
              <img class="object-contain h-full object-center" src="{$urls.no_picture_image.bySize.home_default.url}"
                alt="Placeholder image" title="Placeholder image" loading="lazy"
                width="{$urls.no_picture_image.bySize.home_default.width}"
                height="{$urls.no_picture_image.bySize.home_default.height}" />
            </a>
          {/if}
        {/block}
        {block name="wx_wishlist"}
          {assign var="is_in_wishlist" value=$wx_customshop->isInWishlist($product.id_product)}
          <div data-btns-wishlist-id-product="{$product.id_product}"
            class="w-6 cursor-pointer wx_wishlist_btns absolute z-10 bottom-2 right-0">
            <img data-id-wishlist="{$idWishlist}" data-id-product="{$product.id_product}"
              data-id-product-attribute="{$product.id_product_attribute}"
              class="{if $is_in_wishlist}hidden{/if} wx_btn_wishlist {if $is_logged_in}wx_addto_wishlist{else}wx-loggin-modal{/if}"
              src="{$urls.img_url}/Picto-menu/Coeur-bleu@2x.png" {if !$is_logged_in}data-wx-action="addto_wishlist" {/if}
              alt="Picto Coeur bleu" title="Picto Coeur bleu" />
            <img data-id-wishlist="{$idWishlist}" data-id-product="{$product.id_product}"
              data-id-product-attribute="{$product.id_product_attribute}"
              class="{if !$is_in_wishlist}hidden{/if} wx_btn_wishlist wx_removefrom_wishlist"
              src="{$urls.img_url}/Picto-menu/Coeur-bleu-plein.png" alt="Picto Coeur bleu plein"
              title="Picto Coeur bleu plein" />
          </div>
        {/block}
      </div>
      <div class="flex flex-col justify-between flex-1">
        <div class="">
          {block name='product_name'}
            <div class="mt-2 h-10">
              {if $page.page_name == 'index'}
                <p class="text-[14px] text-gray-950 font-medium">
                  <a class="ellipsis-2" href="{$product.url}" content="{$product.url}">{$product.name|truncate:70:'...'}</a>
                </p>
              {else}
                <p class="text-[14px] text-gray-950 font-medium">
                  <a class="ellipsis-2" href="{$product.url}" content="{$product.url}">{$product.name|truncate:70:'...'}</a>
                </p>
              {/if}
            </div>
          {/block}
        </div>
        {block name='category_and_combinaisons'}
          <div class="flex justify-between items-center">
            {if Manufacturer::getNameById((int) $product.id_manufacturer)}
              <p class="mt-1">
                <a href="{$link->getmanufacturerLink($product.id_manufacturer)}" class="text-[12px] text-gray-500">
                  {Manufacturer::getNameById((int) $product.id_manufacturer)}
                </a>
              </p>
            {/if}
            {if $product.main_variants}
              {* <span class="text-[12px] text-gray-500">8 couleurs disponible</span> *}
              {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
            {/if}
          </div>
        {/block}
        <div class="w-full flex flex-col">
          <div class="flex justify-between items-center">
            {block name='product_price_and_shipping'}
              {if $product.show_price}
                <div class="flex space-x-2 items-end">
                  {if $product.main_variants || $is_cadeau === "1"}
                    <span class="text-sm mb-0.5 text-black">Dès</span>
                  {/if}
                  <p class="my-0 text-black font-extrabold">
                    <span class="reg-price text-lg">
                      <span class='current-price-value'>
                        {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='product_sheet'}{/capture}
                        {if '' !== $smarty.capture.custom_price}
                          {$smarty.capture.custom_price nofilter}
                        {else}
                          {assign var=exploded_price value=","|explode:$product.price}
                          <span class="text-xl">{$exploded_price[0]}</span>,<span class="text-sm">{$exploded_price[1]}</span>
                        {/if}
                      </span>
                    </span>
                  </p>
                  {if $product.has_discount}
                    <p class="product-discount font-bold mt-1">
                      {hook h='displayProductPriceBlock' product=$product type="old_price"}
                      <span class="regular-price text-xs text-reded">{$product.regular_price}</span>
                    </p>
                  {/if}
                </div>
              {/if}
            {/block}
            {if $tarif_degressif === "1"}
              {* <span class="text-[12.5px] border-2 text-gray-400 py-0.5 px-2 rounded">Prix dégressif</span> *}
              <span class="text-xs md:text-sm border-2 text-gray-400 py-0.5 px-2 rounded">Prix dégressif</span>
            {/if}
          </div>
          <div class="add_to_carsou button-container mt-2">
            {* {if $product.main_variants || $is_cadeau === "1"}

              {block name='quick_view'}
                      <a class="quick-view js-quick-view bg-lbg-primary hover:bg-primary block font-medium text-sm text-white p-2 w-full text-center whitespace-nowrap rounded" href="#" data-link-action="quickview">

                {l s='Choisir une option' d='Shop.Theme.Actions'}
                      </a>

              {/block}

            {else} *}
              <form action="{$urls.pages.cart|escape:'htmlall':'UTF-8'}" method="post" accept-charset="utf-8">
                <input type="hidden" name="id_product" value="{$product.id_product|escape:'htmlall':'UTF-8'}" />
                {* {if $product.addcart != 1} *}
                  {if $is_cadeau == 1 || $state_stock == 'in_stock' || $state_stock == 'coming_soon'}
                    {* hopcy :08/02/2024 : create button action onclick *}
                    <style>
                      .btn-state {
                        /* width: 50%; */
                        display: grid;
                        place-content: center;

                        & span {
                          display: none;
                          opacity: 0;
                        }

                        & svg {
                          display: block;
                          opacity: 0;
                        }
                      }
                    </style>
                    {if $is_cadeau == 1}
                      <a 
                      href="{$product.url}"
                      class="block bg-lbg-primary hover:bg-primary font-medium text-sm text-white p-2 w-full text-center whitespace-nowrap rounded" >{l s='Choisir les options' d='Shop.Theme.Actions'}
                      </a>
                    {else}
                      <button type="submit" data-id-product="{$product.id_product|escape:'htmlall':'UTF-8'}"
                        {* hopcy :08/02/2024 : add button action onclick *} onclick="this.classList.toggle('btn-state');"
                        style="transition: width .3s ease-in-out;" data-button-action="add-to-cart" id="add-to-cart-listing-{$product.id_product}"
                        class=" bg-lbg-primary  hover:bg-primary font-medium text-sm text-white p-2 w-full text-center whitespace-nowrap rounded">
                        <span class="text-white"
                          style="opacity: 1; transition: display .5s ;">{l s='Ajouter au panier' d='Shop.Theme.Actions'}</span>
                        {* hopcy :08/02/2024 : add button icon onclick *}
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2"
                          stroke="currentColor" class="w-5 h-5 text-white hidden" style="opacity: 1; transition: display .5s ;">
                          <path class="text-white" stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
                        </svg>
                      </button>
                    {/if}
                  {else}
                    {* {$product.id_product_attribute|dump} *}
                    <button {if $state_stock == 'out_of_stock_with_alert'}@click="{ modalIsOpen = !modalIsOpen }" {/if}
                      type="button" data-id-product="{$product.id_product|escape:'htmlall':'UTF-8'}"
                      data-id-product-attribute="{$product.id_product_attribute|escape:'htmlall':'UTF-8'}"
                      data-button-action="add-to-cart" class="view_waitinglist_modal
                    {if $state_stock == 'out_of_stock'}
                      bg-gray-400
                    {elseif $state_stock == 'out_of_stock_with_alert'}
                      hover:bg-warning bg-warning  
                    {/if}
                    font-medium text-white text-sm p-2 w-full text-center whitespace-nowrap rounded">
                      {if $state_stock == 'out_of_stock_with_alert'}
                        {* {l s='M\'avertir du retour de cet article' d='Shop.Theme.Actions'} *}
                        <span class="hidden md:inline text-current">{l s='M’avertir retour produit' d='Shop.Theme.Actions'}</span>
                        <span class="inline md:hidden text-current">{l s='M\'avertir' d='Shop.Theme.Actions'}</span>
                      {elseif $state_stock == 'out_of_stock'}
                        {l s='Indisponible' d='Shop.Theme.Actions'}
                      {/if}
                    </button>
                  {/if}
                </form>
              {* {/if} *}
            </div>
          </div>
        </div>
      </article>
      {block name='waitinglist_modal'}
        {include file='catalog/_partials/waintinglist-modal.tpl' product=$product}
      {/block}
    </div>
  {/block}