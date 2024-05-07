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

<div class="{if !empty($listing.rendered_facets)} {else} {/if} relative flex items-center products-sort-order dropdown">
  {* Desktop button *}
  <button
    class="select-title hidden md:flex items-center px-6 py-1 border border-gray-500 bg-white rounded"
    style=""
    rel="nofollow"
    data-toggle="dropdown"
    aria-label="{l s='Sort by selection' d='Shop.Theme.Global'}"
    aria-haspopup="true"
    aria-expanded="false">
    <span>{if $listing.sort_selected}{$listing.sort_selected}{else}{l s='Select' d='Shop.Theme.Actions'}{/if}</span>
    <svg xmlns="http://www.w3.org/2000/svg" class="h-5" viewBox="0 0 19.815 26.06">
      <path id="Tracé_1403" data-name="Tracé 1403" d="M0,0,8.357,8.56,0,16.987" transform="translate(1.414 9.357) rotate(-90)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
      <path id="Tracé_1404" data-name="Tracé 1404" d="M0,0,7.376,8.657,0,16.987" transform="translate(18.4 17.684) rotate(90)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
    </svg>    
  </button>
  {* Dropdown *}
  <div class="dropdown-menu">
    {foreach from=$listing.sort_orders item=sort_order}
      <a
        rel="nofollow"
        href="{$sort_order.url}"
        class="select-list {['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
      >
        {$sort_order.label}
      </a>
    {/foreach}
  </div>


  <div x-data="{ open: false }">
    {* Mobile button *}
    <button
      class="flex items-center justify-between w-44 px-4 py-1 md:hidden"
      rel="nofollow"
      @click="open = !open"
      aria-label="{l s='Sort by selection' d='Shop.Theme.Global'}"
    >
      <span class="font-medium text-lbg-primary">{if $listing.sort_selected}{$listing.sort_selected}{else}{l s='Trier' d='Shop.Theme.Actions'}{/if}</span>
      <svg xmlns="http://www.w3.org/2000/svg" width="13.175" height="9.891" viewBox="0 0 13.175 9.891">
        <path id="Tracé_1408" data-name="Tracé 1408" d="M9341.331,1216l5.2,7.5,5.194-7.5" transform="translate(-9339.939 -1214.609)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
      </svg>    
    </button>
    <div x-show="open" x-cloak :class="open ? 'flex' : 'hidden'" class="absolute top-12 -left-0.5 pb-1 flex-col z-50 bg-gray-200">
      {foreach from=$listing.sort_orders item=sort_order}
        <a
          rel="nofollow"
          href="{$sort_order.url}"
          class="select-list {['current' => $sort_order.current, 'js-search-link' => true]|classnames}"
        >
          {$sort_order.label}
        </a>
      {/foreach}
    </div>
  </div>
</div>
