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
<div id="js-product-list-top" class="row mx-auto px-4" style="max-width: 85rem;">
  <div class="w-full py-10">
    {if $page.page_name != "search"}
      <p >
      {l s='%total% produit(s) trouvé(s)' d='Shop.Theme.Catalog' sprintf=[
        '%from%' => $listing.pagination.items_shown_from ,
        '%to%' => $listing.pagination.items_shown_to,
        '%total%' => $listing.pagination.total_items
      ]}
      </p>
    {else}
      <h1 class="font-medium text-[1.7rem]">Produits correspondants à la recherche "{$smarty.get.motclef}"</h1>
    {/if}
    <div class="flex flex-col md:flex-row justify-between mt-1">
      {if $page.page_name == "search"}
        <p >
        {l s='%total% produit(s) trouvé(s)' d='Shop.Theme.Catalog' sprintf=[
          '%from%' => $listing.pagination.items_shown_from ,
          '%to%' => $listing.pagination.items_shown_to,
          '%total%' => $listing.pagination.total_items
        ]}
        </p>
      {else}
        <h2 class="text-xl md:text-2xl font-bold">{if isset($category)}{l s='Tous les produits de la catégorie :' d='Shop.Theme.Global'} {$category.name} {else}Tous les produits {$listing.label}{/if}</h2>
      {/if}
      <div class="hidden md:flex flex-col md:flex-row items-center space-x-4">
        {block name='sort_by'}
          <span class="hidden-sm-down sort-by whitespace-nowrap text-sm  mt-0.5">{l s='Trier par' d='Shop.Theme.Global'}</span>
          {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
        {/block}
      </div>
    </div>
  </div>
  <div class="w-full border-2 divide-x mb-10 grid grid-cols-2 md:hidden bg-white">
    {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
    <button id="search_filter_toggler" class="js-search-toggler flex items-center justify-center space-x-10 p-3">
      <span class="font-medium text-lbg-primary">{l s='Filtrer' d='Shop.Theme.Actions'}</span>
      <svg xmlns="http://www.w3.org/2000/svg" width="13.175" height="9.891" viewBox="0 0 13.175 9.891">
        <path id="Tracé_1408" data-name="Tracé 1408" d="M9341.331,1216l5.2,7.5,5.194-7.5" transform="translate(-9339.939 -1214.609)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
      </svg>
    </button>
    {* {if !empty($listing.rendered_facets)}
      <div class="col-sm-3 col-xs-12 hidden-md-up filter-button">
        <button id="search_filter_toggler" class="text-black js-search-toggler w-full px-8 py-2.5 font-medium lbg-btn lbg-bg-secondary">
          {l s='filtres' d='Shop.Theme.Actions'}
        </button>
      </div>
    {/if} *}
  </div>
</div>

{if $page.page_name == "search"}
<div class="w-full h-72 bg-fff3e8 absolute top-0 left-0 -z-10"></div>
{/if}