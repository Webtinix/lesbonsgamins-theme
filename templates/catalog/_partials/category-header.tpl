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

<div id="js-product-list-header">
    {if $listing.pagination.items_shown_from == 1}
        {if !empty($category.image.bySize.category_default.url)}
            {* {$category.image.bySize|dump} *}
            <div class="w-full h-60 md:h-96">
                {* {$category.image.bySize|dump} *}
                <img 
                    class="h-full w-full object-cover" 
                    {* src="{$category.image.bySize.category_default.url}"  *}
                    src="{$category.image.bySize.wx_category_default.url}" 
                    alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}" 
                    title="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}" 
                    loading="lazy" 
                />
            </div>
        {/if}
        <div class="mx-auto px-4 -mt-12 md:-mt-20 z-10 relative" style="max-width: 85rem;">
            <div class="bg-lbg-secondary rounded-md md:shadow-sm w-full py-6 md:py-16 px-4 md:px-12">
                {assign var='h_1' value=$wx_customshop->get_acf_value('h_1', $category.id, 'category')}
                <h1 class="font-medium text-xl md:text-2xl mb-6 font-bold">{$h_1}</h1>
                {if $category.description}
                    <p id="category-description" class="text-sm">{$category.description nofilter}</p>
                {/if}
            </div>
        </div>
    {/if}
</div>
