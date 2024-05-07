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
{extends file='catalog/listing/product-list.tpl'}

{* {block name='product_list_header'}
  <h1>{l s='List of products by brand %brand_name%' sprintf=['%brand_name%' => $manufacturer.name] d='Shop.Theme.Catalog'}</h1>
  <div id="manufacturer-short_description">{$manufacturer.short_description nofilter}</div>
  <div id="manufacturer-description">{$manufacturer.description nofilter}</div>
{/block} *}

{block name='product_list_header'}
  {*{$manufacturer|dump}*}
  {* {$link->getManufacturerImageLink($manufacturer.id, "large_default")|escape:'html':'UTF-8'|dump} *}
  {* <div id="js-product-list-header">
      {if $listing.pagination.items_shown_from == 1}
          {if !empty($link->getManufacturerImageLink($manufacturer.id, "large_default")|escape:'html':'UTF-8')}
              <div class="w-full h-60 md:h-96">
                  <img class="h-full w-full object-cover" src="{$link->getManufacturerImageLink($manufacturer.id, "large_default")|escape:'html':'UTF-8'}" alt="{if !empty($manufacturer.image.legend)}{$manufacturer.image.legend}{else}{$manufacturer.name}{/if}" loading="lazy" />
              </div>
          {/if}
          <div class="mx-auto px-4 -mt-12 md:-mt-20 z-10 relative" style="max-width: 85rem;">
              <div class="bg-lbg-secondary rounded-md md:shadow-sm w-full py-6 md:py-16 px-4 md:px-12">
                  <h1 class="font-medium text-xl md:text-2xl mb-6 font-bold">Tous les produits {$manufacturer.name}</h1>
                  {if $manufacturer.short_description}
                      <p id="manufacturer-short_description" class="text-sm">{$manufacturer.short_description nofilter}</p>
                  {/if}
              </div>
          </div>
      {/if}
  </div> *}
{/block}

{block name='product_list'}
    
  {include file='catalog/_partials/products.tpl' listing=$listing productClass="col-xs-6 col-xl-3"}
{/block}
