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
 <div class="modal fade js-product-images-modal" id="product-modal">
 <div class="modal-dialog" role="document" style="max-width:52rem;">
   <div class="modal-content">
     <div class="modal-body relative" style="margin-left:0;">
       <button id="close-product-images-modal" class="absolute -right-2 top-0 text-4xl text-white">&times;</button>
       <div class="{if count($product.images) < 2 }hidden{/if} absolute -left-2" style="top:45%;">
         <button data-action="prev" class="nav-modal-images bg-white shadow-lg rounded-md p-2">
           <svg class="{if count($product.images) < 2 }hidden{/if}" xmlns="http://www.w3.org/2000/svg" width="30"
             height="30" viewBox="0 0 40 40">
             <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
               <circle cx="20" cy="20" r="20" stroke="none" />
               <circle cx="20" cy="20" r="19.5" fill="none" />
             </g>
             <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648"
               transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round"
               stroke-linejoin="round" stroke-width="3" />
           </svg>
         </button>
       </div>
       <div class="{if count($product.images) < 2 }hidden{/if} absolute -right-2" style="top:45%;">
         <button data-action="next" class="nav-modal-images bg-white shadow-lg rounded-md p-2">
           <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 40 40">
             <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
               <circle cx="20" cy="20" r="20" stroke="none" />
               <circle cx="20" cy="20" r="19.5" fill="none" />
             </g>
             <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776"
               transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round"
               stroke-linejoin="round" stroke-width="3" />
           </svg>
         </button>
       </div>
       {assign var=imagesCount value=$product.images|count}
       <figure class="max-h-screen mx-auto" id="">
         {if $product.default_image}
           <img id="img-1" style="max-height: calc(100vh - 100px);"
             class="js-modal-product-cover product-cover-modal object-contain" width="1000" loading="lazy"
             src="{$product.default_image.bySize.large_default.url}" {if !empty($product.default_image.legend)}
             alt="{$product.default_image.legend}" title="{$product.default_image.legend}" {else} alt="{$product.name}" title="{$product.name}" 
             {/if}>
         {else}
           <img src="{$urls.no_picture_image.bySize.large_default.url}" loading="lazy"
             width="{$urls.no_picture_image.bySize.large_default.width}"
             height="{$urls.no_picture_image.bySize.large_default.height}" 
             alt="No picture" title="No picture"
            />
         {/if}
         <figcaption class="image-caption">
           {block name='product_description_short'}
             <div id="product-description-short">{$product.name}</div>
           {/block}
         </figcaption>
       </figure>
       <script src="{$urls.js_url}lightzoom.js"></script>
       <script>
         $('.js-modal-product-cover.product-cover-modal').lightzoom({
           glassSize: 250,
           zoomPower: 1.25
         });


         var currentImage = 0;
         const imagesArray = [
           {foreach from=$product.images item=image key=key}
             '{$image.large.url}',
           {/foreach}
         ];

         $('.nav-modal-images').on('click', function() {
           const action = $(this).data('action');
           let lastEl = imagesArray.length - 1;
           if (action == "next") {
             currentImage += 1;
           } else if (action == "prev") {
             currentImage -= 1;
           }

           if (currentImage < 0) {
             currentImage = lastEl;
           } else if (currentImage == lastEl + 1) {
             currentImage = 0;
           }

           console.log('current img: ' + currentImage);
           console.log('array len: ' + imagesArray.length);

           $('figure img#img-1').attr('src', imagesArray[currentImage]);
         })
       </script>
       <style>
         #glass {
           position: absolute;
           max-height: calc(100vh - 100px);
           border-radius: 50%;
           box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 1);
           display: none;
           border: 6px solid #FFF;
           background-repeat: no-repeat;
           background-color: rgba(255, 255, 255, .6);
           z-index: 999999;
           cursor: crosshair;
         }
       </style>
       {* <aside id="thumbnails" class="thumbnails js-thumbnails text-sm-center -right-28" style="position: absolute;max-height: calc(100vh - 55px);">
          {block name='product_images'}
              <div class="js-modal-mask  overflow-hidden 
           {if $imagesCount <= 5} nomargin 
           {/if}" style="max-height: calc(100vh - 55px);">
                <ul class="product-images js-modal-product-images">

           {foreach from=$product.images item=image}
                      <li class="thumb-container js-thumb-container">
                        <img
                          data-image-large-src="{$image.large.url}"
                          class="thumb js-modal-thumb"
                          src="{$image.medium.url}"

             {if !empty($image.legend)}
                              alt="{$image.legend}"
                              title="{$image.legend}"

             {else}
                              alt="{$product.name}"

             {/if}
                          width="{$image.medium.width}"
                          height="148"
                        >
                      </li>

           {/foreach}
                </ul>
              </div>

         {/block}

         {if $imagesCount > 5}
              <div class="arrows js-modal-arrows" style="right: 0;">
                <i class="material-icons arrow-up text-black js-modal-arrow-up">&#xE5C7;</i>
                <i class="material-icons arrow-down text-black js-modal-arrow-down">&#xE5C5;</i>
              </div>

         {/if}
        </aside> *}
       </div>
     </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
 </div><!-- /.modal -->