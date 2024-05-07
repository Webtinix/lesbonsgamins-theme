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

<div class="flex-1 flex space-x-3">
  <div class="flex flex-1 items-center space-x-4">
    <div class="h-16 w-16">
    {if $product.default_image}
      <img 
        class="w-full h-full object-contain" 
        src="{$product.default_image.bySize.cart_default.url}" 
        alt="{$product.name|escape:'quotes'}" 
        title="{$product.name|escape:'quotes'}" 
        loading="lazy"
      >
    {else}
      <img 
        class="w-full h-full object-contain" 
        src="{$urls.no_picture_image.bySize.cart_default.url}" 
        alt="No picture"
        title="No picture"
        loading="lazy" 
      />
    {/if}
    </div>
    <p class="font-semibold text-base flex-1"><a href="{$product.url}" class="">{$product.name|truncate:80:"..."}</a></p>
  </div>
  <div class="py-2.5">
    <span class="block text-sm">{$product.price}</span>
    <span class="block text-xs">Prix unit.</span>
  </div>
</div>
<div class="flex justify-between space-x-6 pt-2.5 md:py-2.5">
  <div class="">
    <div class="input-group bootstrap-touchspin border border-gray-400 rounded-md px-2 py-1">
      <span class="input-group-addon hidden bootstrap-touchspin-prefix" style="display: none;"></span>
      <input 
        class="js-cart-line-product-quantity form-control"
        data-down-url="{$product.down_quantity_url}"
        data-up-url="{$product.up_quantity_url}"
        data-update-url="{$product.update_quantity_url}"
        data-product-id="{$product.id_product}"
        type="number"
        inputmode="numeric"
        pattern="[0-9]*"
        value="{$product.quantity}"
        name="product-quantity-spin"
        aria-label="{l s='%productName% product quantity field' sprintf=['%productName%' => $product.name] d='Shop.Theme.Checkout'}"
        style="display: block;"
      />
      <span class="input-group-addon hidden bootstrap-touchspin-postfix" style="display: none;"></span>
    </div>
    <p class="font-medium text-lg md:text-sm mt-1 text-center">en stock</p>
  </div>
  <div class="">
    <p class="font-medium text-lg w-16 text-right">
    {if !empty($product.is_gift)}
      <span class="gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
    {else}
      {$product.total}
    {/if}
    </p>
  </div>
  <div class="flex space-x-5 items-start">
    {block name="wx_wishlist"}
      {assign var="is_in_wishlist" value=$wx_customshop->isInWishlist($product.id_product)}
      <div class="cursor-pointer wx_wishlist_btns">
        <img 
          data-id-wishlist="{$idWishlist}" 
          data-id-product="{$product.id_product}" 
          data-id-product-attribute="{$product.id_product_attribute}"
          class="{if $is_in_wishlist}hidden{/if} wx_btn_wishlist {if $is_logged_in}wx_addto_wishlist{else}wx-loggin-modal{/if} h-7"
          src="{$urls.img_url}Coeur-noir.png"
          alt="Picto Coeur noir"
          Title="Picto Coeur noir"
          {if !$is_logged_in}data-wx-action="addto_wishlist"{/if}
        />
        <img 
          data-id-wishlist="{$idWishlist}" 
          data-id-product="{$product.id_product}" 
          data-id-product-attribute="{$product.id_product_attribute}"
          class="{if !$is_in_wishlist}hidden{/if} wx_btn_wishlist wx_removefrom_wishlist h-7" 
          src="{$urls.img_url}/Picto-menu/Coeur-bleu-plein.png"
          alt="Picto Coeur vert plein"
          Title="Picto Coeur vert plein"
        />
      </div>
    {/block}    
    <div class="">
      <a
          class                       = "remove-from-cart group h-7 w-6 inline-block"
          rel                         = "nofollow"
          href                        = "{$product.remove_from_cart_url}"
          data-link-action            = "delete-from-cart"
          data-id-product             = "{$product.id_product|escape:'javascript'}"
          data-id-product-attribute   = "{$product.id_product_attribute|escape:'javascript'}"
          data-id-customization   	  = "{$product.id_customization|escape:'javascript'}"
      >
        {if empty($product.is_gift)}
          <svg xmlns="http://www.w3.org/2000/svg" class="h-7 inline-block group-hover:hidden" viewBox="0 0 19.715 25.487">
            <g id="Groupe_3048" data-name="Groupe 3048" clip-path="url(#clip-path)">
              <path id="Tracé_1662" data-name="Tracé 1662" d="M16.319,11.983H.97a.971.971,0,0,0-.933,1.234l1.412,4.592q.195.631.333,1.278L2.039,20.3l1.833,6.486a1.224,1.224,0,0,0,1.178.891h8.675a1.219,1.219,0,0,0,1.206-1.015l2.345-13.543a.971.971,0,0,0-.956-1.135m-.838,6.366a25.624,25.624,0,0,1-.547,2.742l-.271,1.058-.292,1.683-.459,2.651a.19.19,0,0,1-.187.159l-2.491.167a13.214,13.214,0,0,1-1.394.02l-4.79-.186a.191.191,0,0,1-.183-.138l-.714-2.472-.482-1.669L1.145,13.623a.506.506,0,0,1,.454-.645l3.762-.235q.622-.039,1.245-.025l9.172.213a.425.425,0,0,1,.411.486Z" transform="translate(0 -2.189)" fill="#191310"/>
              <path id="Tracé_1663" data-name="Tracé 1663" d="M11.618,16.2a.2.2,0,0,0-.2-.2h-.52a.2.2,0,0,0-.2.2l.126,6.6q.011.555-.026,1.11l-.1,1.491a.2.2,0,0,0,.2.2h.52a.2.2,0,0,0,.2-.2l-.123-4.7c-.007-.3-.007-.6,0-.9Z" transform="translate(-1.952 -2.921)" fill="#191310"/>
              <path id="Tracé_1664" data-name="Tracé 1664" d="M19.662,6.734,17.3,6.071l.112-.4a.372.372,0,0,0-.257-.458l-2.7-.54.455-2.535.05-.558L9.537.058,9.274,0l-.43.257L8.133,2.786,4.821,1.752a.371.371,0,0,0-.458.257l-.112.4L2.369,1.878a.437.437,0,0,0-.539.3L1.477,3.435a.438.438,0,0,0,.3.539L8.223,5.536,19.074,8.831a.437.437,0,0,0,.539-.3l.352-1.254a.438.438,0,0,0-.3-.539M9.2,3.1l.516-1.837,4.016,1.128-.364,2.021c-.044-.013-.09-.02-.134-.034L8.675,2.956Z" transform="translate(-0.267 0)" fill="#191310"/>
              <path id="Tracé_1665" data-name="Tracé 1665" d="M17.052,16.473l-.511-.1a.2.2,0,0,0-.239.161l-1.148,6.5q-.1.548-.239,1.085l-.385,1.444a.2.2,0,0,0,.161.239l.511.1a.2.2,0,0,0,.239-.161l.784-4.632q.075-.443.177-.882l.812-3.518a.2.2,0,0,0-.161-.239" transform="translate(-2.653 -2.99)" fill="#191310"/>
              <path id="Tracé_1666" data-name="Tracé 1666" d="M6.314,20.1,5.8,16.525a.2.2,0,0,0-.237-.165l-.512.092a.2.2,0,0,0-.165.237L6.17,23.166q.108.544.17,1.1L6.5,25.749a.2.2,0,0,0,.236.165l.512-.092a.2.2,0,0,0,.165-.237l-.949-4.6q-.091-.44-.155-.886" transform="translate(-0.891 -2.988)" fill="#191310"/>
            </g>
          </svg>
          <svg xmlns="http://www.w3.org/2000/svg" class="h-7 hidden group-hover:inline-block" viewBox="0 0 18.457 21.824">
            <g id="Groupe_3056" data-name="Groupe 3056" transform="translate(0 0)">
              <g id="Groupe_3052" data-name="Groupe 3052" transform="translate(0 0)" clip-path="url(#clip-path)">
                <path id="Tracé_1670" data-name="Tracé 1670" d="M18.029,3.617h-2.4V3.211a.364.364,0,0,0-.364-.364l-2.688.205L12.331.533,12.223,0H6.707l-.6.054V2.946l-3.4-.1a.364.364,0,0,0-.364.364v.406H.428A.428.428,0,0,0,0,4.045V5.321a.428.428,0,0,0,.428.428L6.92,5.516l11.108.233a.428.428,0,0,0,.428-.428V4.045a.428.428,0,0,0-.428-.428M7.2,2.962V1.093h4.087l.193,2c-.046,0-.091,0-.137,0L6.658,2.962Z" transform="translate(0 0)" fill="#00a193"/>
                <path id="Tracé_1671" data-name="Tracé 1671" d="M16.937,8.051H1.9A.951.951,0,0,0,.983,9.26l1.383,4.5q.191.619.325,1.252L2.945,16.2l1.8,6.355a1.2,1.2,0,0,0,1.154.873h8.5a1.2,1.2,0,0,0,1.181-.995l2.3-13.27a.951.951,0,0,0-.937-1.112m-.821,6.238a25.107,25.107,0,0,1-.536,2.687l-.266,1.037-.286,1.649-.45,2.6a.186.186,0,0,1-.183.155l-2.441.163a12.948,12.948,0,0,1-1.366.019L5.9,22.415a.187.187,0,0,1-.179-.135l-.7-2.422-.473-1.635L2.069,9.658a.5.5,0,0,1,.445-.632L6.2,8.8q.609-.038,1.22-.024l8.988.208a.417.417,0,0,1,.4.476Z" transform="translate(-0.189 -1.603)" fill="#00a193"/>
                <path id="Tracé_1672" data-name="Tracé 1672" d="M12.546,12.262a.2.2,0,0,0-.2-.2h-.509a.2.2,0,0,0-.2.2l.123,6.47q.011.544-.026,1.088l-.1,1.461a.2.2,0,0,0,.2.2h.509a.2.2,0,0,0,.2-.2l-.12-4.6c-.008-.293-.007-.588,0-.881Z" transform="translate(-2.317 -2.401)" fill="#00a193"/>
                <path id="Tracé_1673" data-name="Tracé 1673" d="M17.947,12.539l-.5-.1a.2.2,0,0,0-.235.158L16.088,18.97q-.095.537-.235,1.063l-.377,1.415a.2.2,0,0,0,.158.235l.5.1a.2.2,0,0,0,.235-.158l.768-4.539q.073-.434.173-.864l.8-3.447a.2.2,0,0,0-.158-.235" transform="translate(-3.081 -2.476)" fill="#00a193"/>
                <path id="Tracé_1674" data-name="Tracé 1674" d="M7.232,16.09l-.509-3.5a.2.2,0,0,0-.232-.162l-.5.09a.2.2,0,0,0-.162.232L7.09,19.1c.07.356.127.714.166,1.076l.162,1.455a.2.2,0,0,0,.231.162l.5-.09a.2.2,0,0,0,.162-.232l-.93-4.508c-.059-.288-.109-.577-.151-.868" transform="translate(-1.16 -2.473)" fill="#00a193"/>
              </g>
            </g>
          </svg>
        {/if}
      </a>
    </div>
  </div>
</div>
