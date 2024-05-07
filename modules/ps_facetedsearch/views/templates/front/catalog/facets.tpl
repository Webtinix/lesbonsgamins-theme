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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{if $displayedFacets|count}
  <div id="search_filters" class="w-full h-full" style="padding: 0;">
    <div class="w-full h-full bg-white flex flex-col justify-between md:block">
      {* <div class="overflow-y-auto lbg-scrollbar" style="max-height: calc(100vh - 54vh);"> *}
      <div class="">
        {block name='facets_title'}
          <div class="p-4 pb-1">
            <div class="relative border-b-4 pl-2 pb-2 flex items-center justify-center md:justify-start gap-2">
              <div id="search_filter_controls" class="flex items-center absolute top-0 left-0 h-full hidden-md-up py-0 md:py-4 px-5">
                <span id="_mobile_search_filters_clear_all"></span>
                <button type="button" onclick="$('#search_filters_wrapper').addClass('hidden-sm-down');">
                  <svg xmlns="http://www.w3.org/2000/svg" width="13.161" height="17.705" viewBox="0 0 13.161 17.705">
                    <path id="Tracé_1433" data-name="Tracé 1433" d="M9356.253,1216l-7.463,10.769L9341.331,1216" transform="translate(1227.769 -9339.939) rotate(90)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
                  </svg>
                </button>
              </div>
            
              <svg xmlns="http://www.w3.org/2000/svg" width="35.904" height="18" viewBox="0 0 35.904 18">
                <path id="Tracé_1368" data-name="Tracé 1368" d="M10507.221,4647.71h34.9" transform="translate(-10506.721 -4644)" fill="none" stroke="#191310" stroke-linecap="round" stroke-width="1"/>
                <g id="Ellipse_255" data-name="Ellipse 255" transform="translate(6.279)" fill="#fff" stroke="#191310" stroke-width="1">
                  <circle cx="4" cy="4" r="4" stroke="none"/>
                  <circle cx="4" cy="4" r="3.5" fill="none"/>
                </g>
                <g id="Groupe_2406" data-name="Groupe 2406" transform="translate(-129.721 -2587)">
                  <path id="Tracé_1369" data-name="Tracé 1369" d="M10507.221,4647.71h34.9" transform="translate(-10377 -2047)" fill="none" stroke="#191310" stroke-linecap="round" stroke-width="1"/>
                  <g id="Ellipse_256" data-name="Ellipse 256" transform="translate(152 2597)" fill="#fff" stroke="#191310" stroke-width="1">
                    <circle cx="4" cy="4" r="4" stroke="none"/>
                    <circle cx="4" cy="4" r="3.5" fill="none"/>
                  </g>
                </g>
              </svg>      
              <p class="font-medium text-black text-lg md:text-base">{l s='Filtre' d='Shop.Theme.Actions'}</p>
            </div>
          </div>
        {/block}

        {block name='active_filters'}
          {if $activeFilters|count}
            <div class="flex gap-2 flex-wrap p-4 mb-2">
              {foreach from=$activeFilters item="filter"}
                {block name='active_filters_item'}
                  <div 
                  class="filter-block flex gap-2 items-center justify-between border-2 border-gray-300 rounded px-1 py-1"
                  style="max-width: 100%;">
                    <span class="truncate text-gray-400">
                      {$filter.label}
                    </span>
                    <span class="flex flex-col items-start h-full">
                      {* {l s='%1$s:' d='Shop.Theme.Catalog' sprintf=[$filter.facetLabel]} *}
                      <a class="js-search-link" href="{$filter.nextEncodedFacetsURL}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="10.308" height="10.554" viewBox="0 0 10.308 10.554">
                          <g id="Groupe_2667" data-name="Groupe 2667" transform="translate(-1076.352 -2930.089)">
                            <path id="Tracé_1401" data-name="Tracé 1401" d="M0,0,8.133,3.429" transform="matrix(-0.407, 0.914, -0.914, -0.407, 1084.726, 2932.348)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-width="1"/>
                            <path id="Tracé_1402" data-name="Tracé 1402" d="M0,0,7.811,4.449" transform="translate(1078.255 2932.262) rotate(14)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-width="1"/>
                          </g>
                        </svg>
                      </a>
                    </span>
                  </div>
                {/block}
              {/foreach}
            </div>
          {else}
          <div class="px-4 py-6">
            <p class="text-center">{l s='Aucun filtre appliqué' d='Shop.Theme.Actions'}</p>
          </div>
          {/if}
          <div class="px-4">
            <div class="w-full relative mb-4">
              <button type="submit" class="absolute inset-y-0 start-0 flex items-center ps-3 mb-0 px-1 pl-4">
                <svg class="w-4 h-4 me-2 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                </svg>
              </button>
              <input 
                type="text" id="PremierChampsLateralGauche" name="motclef" value="" aria-label="{l s='Search' d='Shop.Theme.Catalog'}"
                class="bg-fff3e8 border text-gray-900 text-sm rounded focus:outline-none block w-full ps-10 py-2 pr-4 pl-10"
                placeholder="Rechercher rapide  « {if isset($category)} {$category.name} {/if}»" 
                required
              />
            </div>
          </div>
        {/block}

        {block name='facets_clearall_button'}
          {* {if $activeFilters|count}
            <div id="_desktop_search_filters_clear_all" class="hidden-sm-down clear-all-wrapper">
              <button data-search-url="{$clear_all_link}" class="btn btn-tertiary js-search-filters-clear-all">
                <i class="material-icons">&#xE14C;</i>
                {l s='Clear all' d='Shop.Theme.Actions'}
              </button>
            </div>
          {/if} *}
        {/block}

        <div class="w-full overflow-y-auto lbg-scrollbar facet-filter-scroll">
          {foreach from=$displayedFacets item="facet"}
            {assign var=_expand_id value=10|mt_rand:100000}
            {assign var=_collapse value=true}
            {assign var=is_one_facet_selected value="false"}
            {foreach from=$facet.filters item="filter"}
              {if $filter.active}{assign var=_collapse value=false}{/if}
                {* On doit rendre les filtres visibles si au moins une des options de filtres est actives *}
              {if $filter.active}{assign var=is_one_facet_selected value="true"}{/if}
            {/foreach}
            <section class="facet clearfix px-5 md:px-4 py-2" data-type="{$facet.type}" x-data="{ openFacet{$_expand_id}: {$is_one_facet_selected} }">
              <div class="flex justify-between items-center pb-2 mb-2 border-b">
                <p class="text-lbg-primary font-semibold">{$facet.label}</p>
                <button
                  @click="openFacet{$_expand_id} = !openFacet{$_expand_id}"
                >
                  <svg class="transform transition-transform duration-300" :class="!openFacet{$_expand_id} ? 'rotate-180' : '' " xmlns="http://www.w3.org/2000/svg" height="12" viewBox="0 0 17.705 13.161">
                    <path id="Tracé_1406" data-name="Tracé 1406" d="M9341.331,1226.769l7.463-10.769,7.459,10.769" transform="translate(-9339.939 -1215)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
                  </svg>          
                </button>
              </div>

              {* <div class="title hidden-md-up" data-target="#facet_{$_expand_id}" data-toggle="collapse"{if !$_collapse} aria-expanded="true"{/if}>
                <p class="h6 facet-title">{$facet.label}</p>
                <span class="navbar-toggler collapse-icons">
                  <i class="material-icons add">&#xE313;</i>
                  <i class="material-icons remove">&#xE316;</i>
                </span>
              </div> *}

              {if in_array($facet.widgetType, ['radio', 'checkbox'])}
                {block name='facet_item_other'}
                  <div x-show="openFacet{$_expand_id}" x-cloak>
                    <div class="w-full relative mb-3">
                    <button type="submit" class="absolute inset-y-0 start-0 flex items-center ps-3 mb-0 px-1 pl-4">
                      <svg class="w-4 h-4 me-2 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                      </svg>
                    </button>
                    <input 
                      type="text" id="DeuxiemeChampsLateralGauche" name="motclef" value="" aria-label="{l s='Search' d='Shop.Theme.Catalog'}"
                      class="bg-gray-100 border text-gray-900 text-sm rounded focus:outline-none block w-full ps-10 py-2 pr-4 pl-10"
                      placeholder="Rechercher le jeu ou le jouet qui vous donne envie..." 
                      required
                    />
                  </div>
                  {* <ul id="facet_{$_expand_id}" class="collapse{if !$_collapse} in{/if}  h-auto max-h-36 overflow-y-auto lbg-scrollbar"> *}
                  <ul id="facet_{$_expand_id}" class="{if !$_collapse} in{/if}  h-auto max-h-36 overflow-y-auto lbg-scrollbar">
                    {foreach from=$facet.filters key=filter_key item="filter"}
                      {if !$filter.displayed}
                        {continue}
                      {/if}

                      <li>
                        <label class="facet-label{if $filter.active} active {/if}" for="facet_input_{$_expand_id}_{$filter_key}">
                          {if $facet.multipleSelectionAllowed}
                            <span class="custom-checkbox">
                              <input
                                id="facet_input_{$_expand_id}_{$filter_key}"
                                data-search-url="{$filter.nextEncodedFacetsURL}"
                                type="checkbox"
                                {if $filter.active }checked{/if}
                              >
                              {if isset($filter.properties.color)}
                                <span class="color" style="background-color:{$filter.properties.color}"></span>
                              {elseif isset($filter.properties.texture)}
                                <span class="color texture" style="background-image:url({$filter.properties.texture})"></span>
                              {else}
                                <span {if !$js_enabled} class="ps-shown-by-js" {/if} {if $filter.active}style="background: #00A396;"{/if}></span>
                              {/if}
                            </span>
                          {else}
                            <span class="custom-radio">
                              <input
                                id="facet_input_{$_expand_id}_{$filter_key}"
                                data-search-url="{$filter.nextEncodedFacetsURL}"
                                type="radio"
                                name="filter {$facet.label}"
                                {if $filter.active }checked{/if}
                              >
                              <span {if !$js_enabled} class="ps-shown-by-js" {/if}></span>
                            </span>
                          {/if}

                          <a
                            href="{$filter.nextEncodedFacetsURL}"
                            class="_gray-darker search-link js-search-link"
                            rel="nofollow"
                          >
                            {$filter.label}
                            {if $filter.magnitude and $show_quantities}
                              <span class="magnitude">({$filter.magnitude})</span>
                            {/if}
                          </a>
                        </label>
                      </li>
                    {/foreach}
                  </ul>
                  </div>
                {/block}

              {elseif $facet.widgetType == 'dropdown'}
                {block name='facet_item_dropdown'}
                  {* <ul id="facet_{$_expand_id}" class="collapse{if !$_collapse} in{/if}" x-show="openFacet{$_expand_id}" x-cloak> *}
                  <ul id="facet_{$_expand_id}" class="{if !$_collapse} in{/if}" x-show="openFacet{$_expand_id}" x-cloak>
                    <li>
                      <div class="col-sm-12 col-xs-12 col-md-12 facet-dropdown dropdown">
                        <a class="select-title" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          {$active_found = false}
                          <span>
                            {foreach from=$facet.filters item="filter"}
                              {if $filter.active}
                                {$filter.label}
                                {if $filter.magnitude and $show_quantities}
                                  ({$filter.magnitude})
                                {/if}
                                {$active_found = true}
                              {/if}
                            {/foreach}
                            {if !$active_found}
                              {l s='(no filter)' d='Shop.Theme.Global'}
                            {/if}
                          </span>
                          <i class="material-icons float-xs-right">&#xE5C5;</i>
                        </a>
                        <div class="dropdown-menu">
                          {foreach from=$facet.filters item="filter"}
                            {if !$filter.active}
                              <a
                                rel="nofollow"
                                href="{$filter.nextEncodedFacetsURL}"
                                class="select-list js-search-link"
                              >
                                {$filter.label}
                                {if $filter.magnitude and $show_quantities}
                                  ({$filter.magnitude})
                                {/if}
                              </a>
                            {/if}
                          {/foreach}
                        </div>
                      </div>
                    </li>
                  </ul>
                {/block}
              {elseif $facet.widgetType == 'slider'}
                {block name='facet_item_slider'}
                  {foreach from=$facet.filters item="filter"}
                    <ul id="facet_{$_expand_id}" x-show="openFacet{$_expand_id}" x-cloak
                      {* class="faceted-slider collapse{if !$_collapse} in{/if} mb-2 pl-3 md:pl-0" *}
                      class="faceted-slider {if !$_collapse} in{/if} mb-2 pl-3 md:pl-0"
                      data-slider-min="{$facet.properties.min}"
                      data-slider-max="{$facet.properties.max}"
                      data-slider-id="{$_expand_id}"
                      data-slider-values="{$filter.value|@json_encode}"
                      data-slider-unit="{$facet.properties.unit}"
                      data-slider-label="{$facet.label}"
                      data-slider-specifications="{$facet.properties.specifications|@json_encode}"
                      data-slider-encoded-url="{$filter.nextEncodedFacetsURL}"
                    >
                      <li>
                        <p id="facet_label_{$_expand_id}" class="mb-2">
                          {$filter.label}
                        </p>

                        <div id="slider-range_{$_expand_id}"></div>
                      </li>
                    </ul>
                  {/foreach}
                {/block}
              {/if}
            </section>
          {/foreach}
        </div>
      </div>
      <div class="md:hidden w-full">
        <button type="button" 
          onclick="$('#search_filters_wrapper').addClass('hidden-sm-down');" 
          class="text-white text-center p-3 w-full bg-lbg-primary"
        >
          Appliquer les filtres
        </button>
      </div>
      
    </div>
  </div>
{else}
  <div id="search_filters" style="display:none;">
  </div>  
{/if}
