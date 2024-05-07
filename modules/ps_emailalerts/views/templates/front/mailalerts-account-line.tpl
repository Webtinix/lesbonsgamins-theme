{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2015 PrestaShop SA
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

{* <a href="{$mailAlert.link}" class="col-md-2 col-xs-4" style="text-align:center;">
  <img src="{$mailAlert.cover_url}" alt="" style="max-width: 100%;"/>
</a>
<a href="{$mailAlert.link}" class="col-md-8 col-xs-6">
  <div>{$mailAlert.name}
    <span>{$mailAlert.attributes_small}</span>
  </div>
</a>
<a href="#"
   title="{l s='Delete email alert' d='Modules.Emailalerts.Shop'}"
   class="js-remove-email-alert btn btn-link col-xs-2"
   rel="js-id-emailalerts-{$mailAlert.id_product|intval}-{$mailAlert.id_product_attribute|intval}"
   data-url="{url entity='module' name='ps_emailalerts' controller='actions' params=['process' => 'remove']}">
  <i class="material-icons">delete</i>
</a> *}

{assign var='product' value=$wx_customshop->getProductLazyArrayNew($mailAlert.id_product, $mailAlert.id_product_attribute)}
{assign var="tarif_degressif" value=$wx_customshop->get_acf_value('tarif_degressif', $product.id_product)}
{assign var="etiquette" value=$wx_customshop->get_acf_value('Etiquette', $product.id_product)}
{assign var="etiquette_arr" value=explode('|', $etiquette)}

{assign var="made_in_france" value=$wx_customshop->get_acf_value('MADE_IN_FRANCE', $product.id_product)}

{assign var="is_cadeau" value=$wx_customshop->get_acf_value('carte_cadeau', $product.id_product)}
{* {assign var="is_in_wishlist" value=$wx_customshop->isInWishlist($product.id_product)} *}
{assign var="stock_fournisseur" value=$wx_customshop->get_acf_value('stock_fournisseur', $product.id_product)}

{block name='product_miniature_item'}
  <div data-parent="parent-block-product-list" class="h-full js-product product">
    <article class="relative w-full bg-white px-2 py-4 md:p-4 rounded-sm h-full flex flex-col">
      {block name='made_in_france'}
      {if $made_in_france === "1"}
      
        {* hopcy: 08/02/2024 *}
        <svg id="Composant_32_6" data-name="Composant 32 – 6" xmlns="http://www.w3.org/2000/svg" class="drapeau absolute top-4 right-4  z-20" width="35"  viewBox="0 0 46 31">
          <path id="Rectangle_1664" data-name="Rectangle 1664" d="M3,0H15a0,0,0,0,1,0,0V31a0,0,0,0,1,0,0H3a3,3,0,0,1-3-3V3A3,3,0,0,1,3,0Z" fill="#002654"/>
          <rect id="Rectangle_1665" data-name="Rectangle 1665" width="16" height="31" transform="translate(15)" fill="#fff"/>
          <path id="Rectangle_1666" data-name="Rectangle 1666" d="M0,0H12a3,3,0,0,1,3,3V28a3,3,0,0,1-3,3H0a0,0,0,0,1,0,0V0A0,0,0,0,1,0,0Z" transform="translate(31)" fill="#ed2939"/>
        </svg>
        <small class="infobule hidden absolute text-[12px]  shadow-sm p-1 px-2 rounded-sm z-20" style="right: 3.3rem; top:13px;">Fabriqué en France</small>
        <style>
            @media screen and (max-width: 768px) {
              .infobule {
                display: none;
                
              }
              .drapeau{
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
          <span class="font-bold text-xl text-reded">{$product.discount_percentage}</span>
          <img src="{$urls.img_url}Picto-carte-fiche-produit/Barre-chiffre-promotion.png"  class="brightness-95 w-16 max-w-[none]"/>
        </div>
      {else}
        {foreach from=$product.flags item=flag}
          {if $flag.type === "new"}
          <div class="absolute z-10 left-4 top-5 -rotate-12">
            <img src="{$urls.img_url}Picto-carte-fiche-produit/Nouveau-produit.png"  class="w-auto h-14"/>
          </div>
          {/if}
        {/foreach}
      {/if}
      {/block}
      <div class="relative h-40 lg:h-72 thumbnail-container">
        {block name='product_thumbnail'}
          {if $product.cover}
            <a href="{$product.url}" class="w-full overflow-hidden h-full bg-white relative flex justify-center items-center">
              <img
                class="object-contain h-full object-center"
                src="{$product.cover.bySize.home_default.url}"
                alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
                loading="lazy"
                data-full-size-image-url="{$product.cover.large.url}"
                width="{$product.cover.bySize.home_default.width}"
                height="{$product.cover.bySize.home_default.height}"
              />
            </a>
          {else}
            <a href="{$product.url}" class="w-full overflow-hidden h-full bg-white relative flex justify-center items-center">
              <img
                class="object-contain h-full object-center"
                src="{$urls.no_picture_image.bySize.home_default.url}"
                loading="lazy"
                width="{$urls.no_picture_image.bySize.home_default.width}"
                height="{$urls.no_picture_image.bySize.home_default.height}"
              />
            </a>
          {/if}
        {/block}
        {* <button class="absolute z-10 bottom-2 right-0">
          <img src="{$urls.img_url}Picto-menu/Coeur-bleu@2x.png" alt="" class="w-5">
        </button> *}
        {block name="wx_wishlist"}
          {assign var="is_in_wishlist" value=$wx_customshop->isInWishlist($product.id_product)}
          <div data-btns-wishlist-id-product="{$product.id_product}" class="w-6 cursor-pointer wx_wishlist_btns absolute z-10 bottom-2 right-0">
            <img data-id-wishlist="{$idWishlist}" data-id-product="{$product.id_product}"
              data-id-product-attribute="{$product.id_product_attribute}"
              class="{if $is_in_wishlist}hidden{/if} wx_btn_wishlist {if $is_logged_in}wx_addto_wishlist{else}wx-loggin-modal{/if}"
              src="{$urls.img_url}/Picto-menu/Coeur-bleu@2x.png" {if !$is_logged_in}data-wx-action="addto_wishlist" {/if}>
            <img data-id-wishlist="{$idWishlist}" data-id-product="{$product.id_product}"
              data-id-product-attribute="{$product.id_product_attribute}"
              class="{if !$is_in_wishlist}hidden{/if} wx_btn_wishlist wx_removefrom_wishlist"
              src="{$urls.img_url}/Picto-menu/Coeur-bleu-plein.png">
          </div>
        {/block}
      </div>
      <div class="flex flex-col justify-between flex-1">
        <div class="grid grid-cols-1 gap-4 h-full">
          {block name='product_name'}
            <div class="mt-2">
              {if $page.page_name == 'index'}
                <p class="text-[14px] text-gray-950 font-medium">
                  <a class="" href="{$product.url}" content="{$product.url}">{$product.name|truncate:70:'...'}</a>
                </p>
              {else}
                <p class="text-[14px] text-gray-950 font-medium">
                  <a class="" href="{$product.url}" content="{$product.url}">{$product.name|truncate:70:'...'}</a>
                </p>
              {/if}
            </div>
          {/block}
          {block name='category_and_combinaisons'}
            <div class="flex justify-between items-center h-full">
              {if Manufacturer::getNameById((int) $product.id_manufacturer)}
              <p class="mt-1">
                <a href="{$link->getmanufacturerLink($product.id_manufacturer)}" class="text-[12px] text-gray-500">
                  {Manufacturer::getNameById((int) $product.id_manufacturer)}
                </a>
              </p>
              {/if}
              {if $product.main_variants}
                <span class="text-[12px] text-gray-500">{$product.main_variants}{* 8 couleurs disponible *}</span>
              {/if}
              <div class="h-full flex flex-col justify-end">
                <span
                title="{l s='Delete email alert' d='Modules.Emailalerts.Shop'}"
                class="js-remove-email-alert btn btn-link"
                rel="js-id-emailalerts-{$mailAlert.id_product|intval}-{$mailAlert.id_product_attribute|intval}"
                data-url="{url entity='module' name='ps_emailalerts' controller='actions' params=['process' => 'remove']}">
                  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="19.715" height="25.487" viewBox="0 0 19.715 25.487">
                    <defs>
                      <clipPath id="clip-path">
                        <rect id="Rectangle_1972" data-name="Rectangle 1972" width="19.715" height="25.487" fill="none"></rect>
                      </clipPath>
                    </defs>
                    <g>
                      <path id="Tracé_1662" data-name="Tracé 1662" d="M16.319,11.983H.97a.971.971,0,0,0-.933,1.234l1.412,4.592q.195.631.333,1.278L2.039,20.3l1.833,6.486a1.224,1.224,0,0,0,1.178.891h8.675a1.219,1.219,0,0,0,1.206-1.015l2.345-13.543a.971.971,0,0,0-.956-1.135m-.838,6.366a25.624,25.624,0,0,1-.547,2.742l-.271,1.058-.292,1.683-.459,2.651a.19.19,0,0,1-.187.159l-2.491.167a13.214,13.214,0,0,1-1.394.02l-4.79-.186a.191.191,0,0,1-.183-.138l-.714-2.472-.482-1.669L1.145,13.623a.506.506,0,0,1,.454-.645l3.762-.235q.622-.039,1.245-.025l9.172.213a.425.425,0,0,1,.411.486Z" transform="translate(0 -2.189)" fill="#191310"></path>
                      <path id="Tracé_1663" data-name="Tracé 1663" d="M11.618,16.2a.2.2,0,0,0-.2-.2h-.52a.2.2,0,0,0-.2.2l.126,6.6q.011.555-.026,1.11l-.1,1.491a.2.2,0,0,0,.2.2h.52a.2.2,0,0,0,.2-.2l-.123-4.7c-.007-.3-.007-.6,0-.9Z" transform="translate(-1.952 -2.921)" fill="#191310"></path>
                      <path id="Tracé_1664" data-name="Tracé 1664" d="M19.662,6.734,17.3,6.071l.112-.4a.372.372,0,0,0-.257-.458l-2.7-.54.455-2.535.05-.558L9.537.058,9.274,0l-.43.257L8.133,2.786,4.821,1.752a.371.371,0,0,0-.458.257l-.112.4L2.369,1.878a.437.437,0,0,0-.539.3L1.477,3.435a.438.438,0,0,0,.3.539L8.223,5.536,19.074,8.831a.437.437,0,0,0,.539-.3l.352-1.254a.438.438,0,0,0-.3-.539M9.2,3.1l.516-1.837,4.016,1.128-.364,2.021c-.044-.013-.09-.02-.134-.034L8.675,2.956Z" transform="translate(-0.267 0)" fill="#191310"></path>
                      <path id="Tracé_1665" data-name="Tracé 1665" d="M17.052,16.473l-.511-.1a.2.2,0,0,0-.239.161l-1.148,6.5q-.1.548-.239,1.085l-.385,1.444a.2.2,0,0,0,.161.239l.511.1a.2.2,0,0,0,.239-.161l.784-4.632q.075-.443.177-.882l.812-3.518a.2.2,0,0,0-.161-.239" transform="translate(-2.653 -2.99)" fill="#191310"></path>
                      <path id="Tracé_1666" data-name="Tracé 1666" d="M6.314,20.1,5.8,16.525a.2.2,0,0,0-.237-.165l-.512.092a.2.2,0,0,0-.165.237L6.17,23.166q.108.544.17,1.1L6.5,25.749a.2.2,0,0,0,.236.165l.512-.092a.2.2,0,0,0,.165-.237l-.949-4.6q-.091-.44-.155-.886" transform="translate(-0.891 -2.988)" fill="#191310"></path>
                    </g>
                  </svg>
                </span>
              </div>
            </div>
          {/block}
        </div>
        {* <div class="w-full flex flex-col">
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
              <span class="text-[12.5px] border-2 text-gray-400 py-0.5 px-2 rounded">Prix dégressif</span>
            {/if}
          </div>
          <div class="mt-2">
            <a href="#"
            title="{l s='Delete email alert' d='Modules.Emailalerts.Shop'}"
            class="js-remove-email-alert btn btn-link col-xs-2"
            rel="js-id-emailalerts-{$mailAlert.id_product|intval}-{$mailAlert.id_product_attribute|intval}"
            data-url="{url entity='module' name='ps_emailalerts' controller='actions' params=['process' => 'remove']}">
            <i class="material-icons">delete</i>
            </a>
          </div>
        </div> *}
      </div>
    </article>
  </div>
{/block}
 
