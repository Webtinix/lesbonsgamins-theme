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

 {* {$subcategories|dump} *}
 {if !empty($subcategories)}
    {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories) }
    <div class="mx-auto px-4 mt-8 mb-8 md:mb-0" style="max-width: 85rem;">
      <ul id="subcategories" class="w-full relative px-8 md:px-12">
        {foreach from=$subcategories item=subcategory}
          <li class="mt-3 md:mt-3 z-1 flex p-1 md:p-0 border border-lbg-primary md:border-gray-300 h-20 md:h-28 bg-white rounded-md overflow-hidden">
            <div class="w-20 md:w-40 h-full overflow-hidden">
              <a href="{$wx_customshop->generateUrlcategory($subcategory.id_category)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="h-full w-full">
                {if !empty($subcategory.image.large.url)}
                  <img 
                    class="h-full w-full object-cover transform transition duration-500 hover:scale-125" 
                    src="{$link->getCatImageLink($subcategory["link_rewrite"],$subcategory["id_category"])}" 
                    alt="{$subcategory.name|escape:'html':'UTF-8'}" 
                    title="{$subcategory.name|escape:'html':'UTF-8'}" 
                    loading="lazy" width="141" height="180"
                  />
                {/if}
              </a>
            </div>
            <div class="flex-1 flex items-center p-3">
                <p class="text-sm font-medium text-lbg-primary">
                  <a class="" href="{$wx_customshop->generateUrlcategory($subcategory.id_category)|escape:'html':'UTF-8'}">{$subcategory.name|escape:'html':'UTF-8'}</a>
                </p>
            </div>
          </li>
        {/foreach}
      </ul>
    </div>
    {if $subcategories|count <= 4}
    <style>
      @media (min-width: 768px) { 
        #subcategories .owl-stage-outer {
          display: flex;
          justify-content: center;
          align-items: center;
          overflow: visible;
        }
      }
    </style>
    {/if}
  {/if}
{/if}
