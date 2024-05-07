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
{block name='head_microdata_special'}
  {include file='_partials/microdata/product-list-jsonld.tpl' listing=$listing}
{/block}
{block name='content'}
  <section id="main" class="relative">

    {if $page.page_name == "prices-drop"}
    {block name='prices_drop_head'}
      {include file='catalog/_partials/prices-drop-header.tpl' listing=$listing}
    {/block}
    {/if}

    {if !($page.page_name == "category" && isset($category) && ($category['level_depth'] === "2"))}
    {block name='product_list_header'}

    {/block}
    {/if}

    {if !($page.page_name == "category" && isset($category) && ($category['level_depth'] === "2"))}
      {block name='subcategory_list'}
        {if isset($subcategories) && $subcategories|@count > 0}
          {include file='catalog/_partials/subcategories.tpl' subcategories=$subcategories}
        {/if}
      {/block}
    {/if}
    {if $page.page_name == "manufacturer"}
      {assign var=categories_for_manufacturer value=$wx_customshop->getCategoriesN1ByIdManufacturer($manufacturer.id, $language.id, true)}
      <div class="w-full relative flex bg-fff3e8 pb-16 md:pb-28">
        <div class="relative mx-auto px-4 w-full" style="max-width: 85rem;">
          <div class="w-full flex flex-col gap-6 items-start md:flex-row py-6 md:py-12"> <!-- Utilisation de flex-col pour les petits écrans et flex-row pour les grands -->
            <div class="w-full md:w-1/2 flex justify-center"> <!-- Image occupe la moitié de la largeur sur les grands écrans -->
              {hook h='displayCreativeSlider'}
            </div>
            <div class="w-full md:w-1/2 flex flex-col md:pl-20">
              <h1 class="text-2xl md:text-3xl font-bold mb-2">{$manufacturer.h1}</h1>
              <div class="text-sm my-1 page-content page-cms">
                {$manufacturer.short_description nofilter}
              </div>
            </div>
          </div>   
        </div>
      </div>
      <div class="relative mx-auto px-4 w-full -mt-20 md:-mt-24" style="max-width: 85rem;">
        <div class="w-full relative -mx-4">
          <div class="w-full">
            {block name='subcategory_list'}
              {if isset($categories_for_manufacturer) && $categories_for_manufacturer|@count > 0}
                {include file='catalog/_partials/subcategories.tpl' subcategories=$categories_for_manufacturer}
              {/if}
            {/block}
          </div>
        </div>
      </div>
      {hook h='displayBrandPage'}
    {/if}
    {if $listing.products|count}
     
      {block name='product_list_top'}
        {if !($page.page_name == "category" && isset($category) && ($category['level_depth'] === "2"))}
        {include file='catalog/_partials/products-top.tpl' listing=$listing}
        {/if}
      {/block}

      {if !($page.page_name == "category" && isset($category) && ($category['level_depth'] === "2"))}
        <section id="products" style="max-width: 85rem;" class="mx-auto flex px-4 gap-8">
          {hook h="displayLeftColumn"}
          {block name='product_list'}
            {include file='catalog/_partials/products.tpl' listing=$listing productClass="col-xs-6 col-xl-4"}
          {/block}
        </section>
      {/if}

      {block name='product_list_bottom'}
        {include file='catalog/_partials/products-bottom.tpl' listing=$listing}
      {/block}

    {else}
      <div id="js-product-list-top"></div>

      <div id="js-product-list">
        {capture assign="errorContent"}
          <h4>{l s='No products available yet' d='Shop.Theme.Catalog'}</h4>
          <p>{l s='Stay tuned! More products will be shown here as they are added.' d='Shop.Theme.Catalog'}</p>
        {/capture}

        {include file='errors/not-found.tpl' errorContent=$errorContent}
      </div>

      <div id="js-product-list-bottom"></div>
    {/if}
    {if ($page.page_name == "category" && isset($category) && ($category['level_depth'] >= "2"))}
      {if isset($category)}
      {include file="customize/category-bottom-description.tpl" category=$category}
      {/if}
    {/if}

    {hook h="displayFooterCategory"}

  </section>
{/block}
