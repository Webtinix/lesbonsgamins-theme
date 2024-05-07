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
<div class="relative images-container js-images-container">
  {assign var="made_in_france" value=$wx_customshop->get_acf_value('MADE_IN_FRANCE', $product.id_product)}
  {assign var="id_video_youtube" value={widget name='advancedcustomfields' hook='id_video_youtube'}}
  {assign var="id_video_youtube" value=trim(preg_replace('/<!--(.|\s)*?-->/', '', $id_video_youtube))}

  {assign var="width_owl_carousel_item" value=70}
  {assign var="width_owl_carousel_item_margin" value=10}
  {assign var="nbr_max_item" value=5}
  {* C'est la marge des nav de own carroussel et est le double de la marge des nav *}
  {assign var="double_margin_nav_owl" value=70}
  <div class="w-full h-full relative flex">
    {block name='product_cover'}


      {* Owl carrousel vertical *}
      <div class="hidden lg:flex">
        <div class="owl-carousel owl-theme product-images js-qv-product-images" id="deskTopCoversNav">
          {if $id_video_youtube != ""}
            <div class="item thumb-container js-thumb-container">
              <div class="thumb js-thumb relative thumbnail_video">
                {if $product.default_image}
                  <img style="margin: 0;" class="w-14" src="{$product.default_image.bySize.large_default.url}"
                    {if !empty($product.default_image.legend)} alt="{$product.default_image.legend}"{else} alt="{$product.name}" {/if} 
                    title="{$product.name}"
                    loading="lazy"
                  />
                {/if}
                <div class="video-yt w-full h-full absolute top-0 bg-black bg-opacity-50 flex items-center justify-center"
                  style="padding:10px;">
                  <svg class="" xmlns="http://www.w3.org/2000/svg" width="90" height="90" viewBox="0 0 90 90">
                    <path id="Polygone_17" data-name="Polygone 17"
                      d="M19.421,4.337a3,3,0,0,1,5.157,0L41.3,32.467A3,3,0,0,1,38.726,37H5.274A3,3,0,0,1,2.7,32.467Z"
                      transform="translate(69.738 23.614) rotate(90)" fill="#fd737c" />
                    <g id="Ellipse_274" data-name="Ellipse 274" fill="none" stroke="#fd737c" stroke-width="3">
                      <circle cx="45" cy="45" r="45" stroke="none" />
                      <circle cx="45" cy="45" r="43.5" fill="none" />
                    </g>
                  </svg>
                </div>
              </div>
            </div>
          {/if}
          {foreach from=$product.images key=key item=image}
            <div class="item thumb-container js-thumb-container cursor-pointer">
              <img data-id="wx_product_images_thumb_{$image.id_image}"
                title="{$product.name}"
                @click="wx_active_img = 'wx_product_images_thumb_{$image.id_image}'"
                x-ref="wx_product_images_thumb_{$image.id_image}" style="margin: 0;"
                class="w-14 hidden sm:block thumb js-thumb img-thumb {if $image.id_image == $product.default_image.id_image} selected js-thumb-selected {/if}"
                data-image-medium-src="{$image.bySize.large_default.url}"
                data-image-large-src="{$image.bySize.large_default.url}" src="{$image.bySize.large_default.url}"
                {if !empty($image.legend)} alt="{$image.legend}" title="{$image.legend}" {else} alt="{$product.name}" {/if}
                loading="lazy" width="{$product.default_image.bySize.small_default.width}"
                height="{$product.default_image.bySize.small_default.height}"
              />
              <span
                class="sm:hidden thumb m-0 js-thumb img-thumb h-4 w-4 rounded-full border-2 bg-transparent {if $image.id_image == $product.default_image.id_image} selected js-thumb-selected {/if}"
                data-image-medium-src="{$image.bySize.large_default.url}"
                data-image-large-src="{$image.bySize.large_default.url}">
              </span>
            </div>
          {/foreach}
        </div>        
      </div>
      <script>
        $( document ).ready(function() {
          $("#deskTopCoversNav").owlCarousel({
            items: 6,
            loop: {if $product.images|count >= 7}true{else}false{/if},
            mouseDrag: false,
            touchDrag: false,
            pullDrag: false,
            rewind: true,
            autoplay: false,
            margin: 10,
            nav: true,
            dots: false,
            navText: [
              `<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 40 40">
                <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
                    <circle cx="20" cy="20" r="20" stroke="none"/>
                    <circle cx="20" cy="20" r="19.5" fill="none"/>
                </g>
                <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648" transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                </svg>
              `,

              `<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 40 40">
                <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
                    <circle cx="20" cy="20" r="20" stroke="none"/>
                    <circle cx="20" cy="20" r="19.5" fill="none"/>
                </g>
                <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776" transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                </svg>
              `
            ],
          });
        });
      </script>
      <style>
        .owl-carousel{
          transform: rotate(90deg);
          width: 470px;
          margin-top: 225px;
          position: absolute;
          left: -202px;
        } 
        .item{
          transform: rotate(-90deg);
          float: left;
        }
        .owl-carousel .owl-nav{
          display: flex;
          justify-content: space-between;
          position: absolute;
          width: 118%;
          top: calc(50% - 19px);
          right: -43px;
          z-index: -1;
        }
        div.owl-carousel .owl-nav .owl-prev, div.owl-carousel .owl-nav .owl-next{
          font-size:36px;
          top:unset;
          bottom: 15px; 
        }
        .item.thumb-container.js-thumb-container .selected {
          border: #00A193 3px solid;
        }
        .owl-theme .owl-nav [class*=owl-]:hover {
          background: transparent;
        }
        .item.thumb-container.js-thumb-container .selected {
          border: #00A193 3px solid;
        }
        #productCovers .owl-dots{
          margin-bottom: 0;
          margin-left: 20px;
          margin-right: 20px;
        }
      </style>
      {* Owl carrousel vertical *}

      <div class="flex w-full h-full justify-items-center items-center relative product-cover lg:pl-20">
        <div id="coversContainer" class="w-full h-full">
        <button type="button" id="zoomClose"></button>
          <div id="youtube-iframe-container" class="w-full m-auto js-qv-product-cover img-fluid"></div>
          {if $product.default_image}
            <div class="w-full h-full" id="productCovers">
              <img class="block w-full m-auto js-qv-product-cover img-fluid"
                src="{$product.default_image.bySize.large_default.url}" {if !empty($product.default_image.legend)}
                alt="{$product.default_image.legend}" title="{$product.default_image.legend}" {else} alt="{$product.name}" 
                {/if}
                title="{$product.name}"
                loading="lazy" width="{$product.default_image.bySize.medium_default.width}"
                height="{$product.default_image.bySize.medium_default.height}"
              />
              {foreach from=$product.images key=key item=image}
                {if $id_video_youtube != "" && $key == 0}
                  <div class="w-full h-full" x-data="{ iframeIsOpen: false }">
                    <div class="w-full h-full relative" x-cloak x-show="!iframeIsOpen">
                      <img class="block w-full m-auto js-qv-product-cover img-fluid"
                        src="{$product.default_image.bySize.large_default.url}" {if !empty($product.default_image.legend)}
                        alt="{$product.default_image.legend}" title="{$product.default_image.legend}" {else} alt="{$product.name}"  title="{$product.name}"
                        {/if}
                        loading="lazy" width="{$product.default_image.bySize.medium_default.width}"
                        height="{$product.default_image.bySize.medium_default.height}"
                      />
                      <div @click="{ iframeIsOpen = true }" class="w-full h-full absolute top-0 left-0 bg-black bg-opacity-50 flex items-center justify-center">
                        <svg class="" xmlns="http://www.w3.org/2000/svg" width="90" height="90" viewBox="0 0 90 90">
                          <path id="Polygone_17" data-name="Polygone 17"
                            d="M19.421,4.337a3,3,0,0,1,5.157,0L41.3,32.467A3,3,0,0,1,38.726,37H5.274A3,3,0,0,1,2.7,32.467Z"
                            transform="translate(69.738 23.614) rotate(90)" fill="#fd737c" />
                          <g id="Ellipse_274" data-name="Ellipse 274" fill="none" stroke="#fd737c" stroke-width="3">
                            <circle cx="45" cy="45" r="45" stroke="none" />
                            <circle cx="45" cy="45" r="43.5" fill="none" />
                          </g>
                        </svg>
                      </div>
                    </div>
                    <iframe 
                      src="https://www.youtube.com/embed/{$id_video_youtube}" 
                      class="w-full h-full" x-cloak x-show="iframeIsOpen">
                    </iframe>
                  </div>
                {/if}
                {if $image.bySize.medium_default.url !== $product.default_image.bySize.medium_default.url}
                  <img class="block w-full m-auto js-qv-product-cover img-fluid"
                    src="{$image.bySize.large_default.url}" 
                    {if !empty($image.legend)} alt="{$image.legend}" title="{$image.legend}" {else} alt="{$product.name}" title="{$product.name}" {/if}
                    loading="lazy" width="{$product.default_image.bySize.small_default.width}"
                    height="{$product.default_image.bySize.small_default.height}"
                  />
                {/if}
              {/foreach}
            </div>
            {* <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
              class="absolute top-2 md:top-16 left-2 lg:left-28 w-20" viewBox="0 0 105.923 100.359">
              <defs>
                <pattern id="pattern" preserveAspectRatio="none" width="100%" height="100%" viewBox="0 0 88 82">
                  <image width="88" height="82"
                    xlink:href="data:image/png;base64,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" />
                </pattern>
              </defs>
              <rect id="Picto_fiche_produit_Nouveau" data-name="Picto fiche produit_Nouveau" width="93.495" height="86.802"
                transform="translate(0 14.626) rotate(-9)" fill="url(#pattern)" />
            </svg> *}
            <div class="layer hidden-sm-down md:hidden" data-toggle="modal" data-target="#product-modal">
              <svg class="opacity-30" width="30%" height="30%" viewBox="0 0 24 24" fill="none"
                xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M15.7955 15.8111L21 21M18 10.5C18 14.6421 14.6421 18 10.5 18C6.35786 18 3 14.6421 3 10.5C3 6.35786 6.35786 3 10.5 3C14.6421 3 18 6.35786 18 10.5Z"
                  stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
              </svg>
            </div>
          {else}
            <img class="img-fluid" src="{$urls.no_picture_image.bySize.large_default.url}" loading="lazy"
              width="{$urls.no_picture_image.bySize.medium_default.width}"
              height="{$urls.no_picture_image.bySize.medium_default.height}"
              title="{$product.name}"
            />
            {* <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
              class="absolute top-2 md:top-16 left-2 lg:left-28 w-20" viewBox="0 0 105.923 100.359">
              <defs>
                <pattern id="pattern" preserveAspectRatio="none" width="100%" height="100%" viewBox="0 0 88 82">
                  <image width="88" height="82"
                    xlink:href="data:image/png;base64,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" />
                </pattern>
              </defs>
              <rect id="Picto_fiche_produit_Nouveau" data-name="Picto fiche produit_Nouveau" width="93.495" height="86.802"
                transform="translate(0 14.626) rotate(-9)" fill="url(#pattern)" />
            </svg> *}
          {/if}
        </div>
        {if $made_in_france == 1}
          <svg id="Composant_32_6" data-name="Composant 32 – 6" xmlns="http://www.w3.org/2000/svg"
            class="drapeau absolute top-4 right-0 w-10" viewBox="0 0 46 31">
            <path id="Rectangle_1664" data-name="Rectangle 1664"
              d="M3,0H15a0,0,0,0,1,0,0V31a0,0,0,0,1,0,0H3a3,3,0,0,1-3-3V3A3,3,0,0,1,3,0Z" fill="#002654" />
            <rect id="Rectangle_1665" data-name="Rectangle 1665" width="16" height="31" transform="translate(15)"
              fill="#fff" />
            <path id="Rectangle_1666" data-name="Rectangle 1666"
              d="M0,0H12a3,3,0,0,1,3,3V28a3,3,0,0,1-3,3H0a0,0,0,0,1,0,0V0A0,0,0,0,1,0,0Z" transform="translate(31)"
              fill="#ed2939" />
          </svg>
          <small class="infobule hidden absolute top-4 right-10 text-[12px]  shadow-sm p-1 px-2 rounded-sm">
            Fabriqué en France
          </small>
        {/if}
      </div>
      {block name='product_images'}
        <div class="absolute right-2 bottom-8 hidden lg:flex">
          {block name="wx_wishlist"}
            {assign var="is_in_wishlist" value=$wx_customshop->isInWishlist($product.id_product)}
            <div data-btns-wishlist-id-product="{$product.id_product}" class="w-6 cursor-pointer wx_wishlist_btns">
              <img data-id-wishlist="{$idWishlist}" data-id-product="{$product.id_product}"
                data-id-product-attribute="{$product.id_product_attribute}"
                class="{if $is_in_wishlist}hidden{/if} wx_btn_wishlist {if $is_logged_in}wx_addto_wishlist{else}wx-loggin-modal{/if}"
                src="{$urls.img_url}/Picto-menu/Coeur-bleu@2x.png" {if !$is_logged_in}data-wx-action="addto_wishlist" {/if}
                title="Picto Coeur"
                alt="Picto Coeur"
              >
              <img data-id-wishlist="{$idWishlist}" data-id-product="{$product.id_product}"
                data-id-product-attribute="{$product.id_product_attribute}"
                class="{if !$is_in_wishlist}hidden{/if} wx_btn_wishlist wx_removefrom_wishlist"
                src="{$urls.img_url}/Picto-menu/Coeur-bleu-plein.png"
                title="Picto Coeur Plein"
                alt="Picto Coeur Plein"
              >
            </div>
          {/block}
        </div>
      {/block}
    {/block}
    {hook h='displayAfterProductThumbs' product=$product}
  </div>
</div>
<script>
  // Jimmy: 
  // Le code sert à faire scroller l'ancre vers le bas de façon cool
  $(document).ready(function() {
    // Code JavaScript pour gérer le carousel
    $("#productCovers").owlCarousel({
      items: 1,
      loop: true,
      pullDrag: false,
      rewind: true,
      dots: false,
      responsive:{
        0:{
          dots:true,
        },
        600:{
          dots:false,
        },
      },
    });

    $('#coversContainer').on('click', function(e) {
      if ($(e.target).is('.js-qv-product-cover')) {
        $('#coversContainer').addClass('fixed md:relative top-0 left-0 bg-black md:bg-transparent flex md:block items-center justify-center px-4 z-999')
        $('#productCovers').css('height', 'auto')
        $('#zoomClose').replaceWith('<button type="button" id="zoomClose" class="absolute right-2 top-0 text-4xl text-white">&times;</button>')
      }
    })
    $(document).on('click', '#zoomClose', function(e) {
      if (e.target.id === 'zoomClose') {
        $('#coversContainer').removeClass('fixed md:relative top-0 left-0 bg-black md:bg-transparent flex md:block items-center justify-center px-4 z-999')
        $('#productCovers').css('height', '100%')
        $('#zoomClose').replaceWith('<button type="button" id="zoomClose"></button>')
      }
    })


    // Pour la gestion des direction du slide des images
    // $('.direction-slide-img').on('click', function() {

    //   let images = [
    //     {foreach from=$product.images item=image}
    //     'wx_product_images_thumb_{$image.id_image}',
    //     {/foreach} 
    //   ];

    //   let me = $(this);
    //   if (me.hasClass('direction-right')) {
    //     $(".wx-product-images-scroll.owl-carousel").trigger('next.owl.carousel');
    //   } else if (me.hasClass('direction-left')) {
    //     $(".wx-product-images-scroll.owl-carousel").trigger('prev.owl.carousel');
    //   }

    //   let id = $('.wx-product-images-scroll img.selected').attr('data-id');

    //   images.forEach(function(image, index, array) {
    //     // alert(id);
    //     if (image == id) {

    //       if (me.hasClass('direction-right')) {
    //         next_selection = (index + 1) % array.length;
    //       } else if (me.hasClass('direction-left')) {
    //         next_selection = (index - 1) % array.length < 0 ? array.length - 1 : (index - 1) % array.length;
    //       }
    //       let next_image = array[next_selection];
    //       $('img[x-ref="' + next_image + '"]').trigger('click');
    //       $('img[x-ref="' + next_image + '"]').addClass('js-thumb-selected selected');
    //       console.log($('img[x-ref="' + next_image + '"]'));
    //       // $('#' + next_image).addClass('selected');
    //     }
    //   })
    //   // alert(id);

    //   // $(".wx-product-images-scroll.owl-carousel").trigger('to.owl.carousel', images.indexOf($(this).data('image')));
    // });

    // Pour selectionner l'image dans le slider sur mobile
    $('.data-mobile-nav').on('click', function(e) {
      $('.product-covers').trigger('to.owl.carousel', $(this).data('position'));
    })
  });



  // Fonction pour ajouter dynamiquement l'iframe YouTube
  function loadYoutubeIframes() {
    var container = document.querySelector("#youtube-iframe-container");

    var iframe = document.createElement("iframe");
    iframe.src = "https://www.youtube.com/embed/{$id_video_youtube}";
    iframe.id = "youtube-iframe"
    iframe.title = "YouTube video player";
    iframe.frameborder = "0";
    iframe.allow = "autoplay; encrypted-media";
    iframe.allowFullscreen = true;

    // Récupérez l'élément à remplacer
    var existingIframe = container.querySelector("#youtube-iframe");

    // Remplacez l'élément existant par le nouvel élément iframe
    if (!existingIframe) {
      container.appendChild(iframe)
    }
  }
  $('.video-yt, #playYT').on('click', function() {
    // Appel à la fonction pour charger les iframes
    loadYoutubeIframes();
  });


  // 1. This code loads the IFrame Player API code asynchronously.
  var tag = document.createElement('script');

  tag.defer = true;
  tag.src = "https://www.youtube.com/iframe_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  // 2. This function creates an <iframe> (and YouTube player)
  //    after the API code downloads.
  var player;

  function onYouTubeIframeAPIReady() {
    player = new YT.Player('player', {
      height: '100%',
      width: '100%',
      playerVars: {
        autoplay: 1,
        loop: 1,
        controls: 0,
        showinfo: 0,
        autohide: 1,
        modestbranding: 1,
        vq: 'hd1080'
      },
      videoId: '{$id_video_youtube}',
      events: {
        'onReady': onPlayerReady,
        'onStateChange': onPlayerStateChange
      }
    });
  }

  // 3. The API will call this function when the video player is ready.
  function onPlayerReady(event) {

  }

  var done = false;

  function onPlayerStateChange(event) {

  }

  function stopVideo() {
    player.stopVideo();
  }

  $('#playYT').on('click', function(e) {
    const action = $(this).data('action');
    if (action == "play-video") {
      player.playVideo();
      $(this).data('action', 'stop-video');
      $(this).removeClass('bg-black');
      $(this).children().hide();
    } else if (action == "stop-video") {
      player.stopVideo();
      $(this).data('action', 'play-video');
      $(this).addClass('bg-black');
      $(this).children().show();
    }
  })
</script>