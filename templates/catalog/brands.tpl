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
  <section id="main" class="relative">
    <div class="w-full absolute top-0 left-0 -z-10">
      <div class="w-full h-96 bg-fff3e8"></div>      
      <div class="w-full h-60 md:h-40 bg-fff3e8"></div>
    </div>
    <div class="relative mx-auto px-4" style="max-width: 85rem;">
      <div class="w-full flex flex-col gap-6 items-center md:flex-row py-6 md:py-12"> <!-- Utilisation de flex-col pour les petits écrans et flex-row pour les grands -->
        <div class="w-full md:w-1/2 flex justify-center"> <!-- Image occupe la moitié de la largeur sur les grands écrans -->
          {assign var="banner_img" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(18)}
          {$banner_img nofilter}
        </div>
        <div class="w-full md:w-1/2 flex flex-col md:pl-20">
          {* <p class="text-2xl md:text-3xl font-bold mb-2">Nos marques de jouets et jeux en bois</p>
          <p class="text-sm my-1">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
          </p>
          <p class="text-sm my-1">
            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
          </p> *}
          {assign var="banner_text" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(17)}
          {$banner_text nofilter}
        </div>
      </div>

      <div class="w-full relative">
        <div class="bg-white rounded-t-md w-full md:px-8 md:py-10 px-3 py-5">
          <p class="font-medium text-xl md:text-2xl font-bold mb-6">Retrouvez une marque de jouets et jeux en bois</p>
          <div class="w-full relative mb-4">
            <button type="submit" class="absolute top-2.5 flex items-center px-1 pl-4">
              <svg class="w-4 h-4 me-2 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"></path>
              </svg>
            </button>
            <input type="search" name="brandKeyword" placeholder="Rechercher une marque" aria-label="Recherche" class="bg-gray-100 text-gray-900 text-sm rounded focus:outline-none block w-full py-2 pr-4 pl-10" />
          </div>
          {assign var="alphabet" value=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','#']}
          <ul class="grid grid-cols-4 md:flex md:flex-wrap gap-3">
            {foreach $alphabet as $key => $letter}
              {assign var="hasBrands" value=false}
              {foreach from=$brands item=brand}
                {if $brand.name[0] === $letter}
                  {assign var="hasBrands" value=true}
                {/if}
              {/foreach}
              <li class="{if $hasBrands || $letter === "#"}alphabet-letter{else}text-gray-300{/if} flex items-center gap-2 md:gap-3">
                <button class="md:text-xl font-medium {if $letter === "#"}text-lbg-primary{/if} {if !$hasBrands && $letter !== "#"}cursor-default{/if}" data-letter="{$letter}">{$letter}</button>
                {if $key < ($alphabet|count - 1)}
                <span class="w-1.5 h-0.5 bg-black inline-block"></span>
                {/if}
              </li>
            {/foreach}
          </ul>
        </div>
      </div>
      <div class="mt-6">
        <div class="flex flex-col">
          {block name='brand_miniature'}
            {foreach $alphabet as $key => $letter}
              {assign var="hasBrands" value=false}
              {foreach from=$brands item=brand}
                {if $brand.name[0] === $letter}
                  {assign var="hasBrands" value=true}
                {/if}
              {/foreach}
              <div class="">
                {if $hasBrands}
                <div class="border-b border-black">
                  <span class="text-2xl font-bold">{$letter}</span>
                </div>
                {/if}
                <ul class="brandlist flex flex-wrap gap-8 {if $hasBrands}my-8{/if}">
                  {foreach from=$brands item=brand}
                    {if $brand.name[0] === $letter}
                      {include file='catalog/_partials/miniatures/brand.tpl' brand=$brand}
                    {/if}
                  {/foreach}
                </ul>
              </div>
            {/foreach}
            {* {assign var="currentLetter" value=""}
            {foreach $brands item=brand}
            {if $smarty.foreach.brand.index == 1 || $brand.name[0] != $brands[$smarty.foreach.brand.index - 2].name[0]}
              {if $smarty.foreach.brand.index != 1}</div>{/if} <!-- Ferme la div précédente si ce n'est pas le premier élément -->
              <div class="w-full"> <!-- Commence une nouvelle div pour la nouvelle lettre -->
                <div class="text-2xl font-bold border-b border-black">{$brand.name[0]}</div> <!-- Affiche la lettre -->
              {/if}
                <div class="flex justify-center md:w-52">
                  {include file='catalog/_partials/miniatures/brand.tpl' brand=$brand} <!-- Inclut le template de la marque -->
                </div>
              {/foreach}
              </div> *}
          {/block}   
        </div>
      </div>    
    </div>
  </section>
  <script>
    $('.alphabet-letter button').on('click', function() {
      const letter = $(this).data('letter')
      
      $('.alphabet-letter button').removeClass('text-lbg-primary')      
      $(this).addClass('text-lbg-primary')
      
      $('.brand').parent().parent().hide()
      $('.brand[data-letter="'+letter+'"]').parent().parent().show()

      if(letter === "#") {
        $('.alphabet-letter button').removeClass('text-lbg-primary')  
        $('.alphabet-letter button[data-letter="#"]').addClass('text-lbg-primary')
        $('.brand').parent().parent().show()
      }
    })

    $('input[name="brandKeyword"]').on('change', function() {
      const searchWord = $(this).val().toLowerCase()

      $('.brand').each(function(i, brand){
        const brandName = $(brand).data('name').toLowerCase()
        
        if (!brandName.includes(searchWord)) {         
          $(brand).hide()
        } else {         
          $(brand).show()
        }

        $('.brandlist').parent().show()
        $('.brandlist').each(function(i, brandList) {
          if($(brandList).children(':visible').length === 0) {
            $(brandList)?.parent().hide()
          }
        })
      })
    })
  </script>
{/block}
