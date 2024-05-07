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
<div class="col-md-6 links">
  <div class="row">
  {foreach $linkBlocks as $linkBlock}
    <div 
      x-data="{ linksGroup{$linkBlock.id}IsOpen : false }" 
      class="col-md-4 py-3 px-0 md:px-2 md:pt-0 border-b md:border-none"
    >
       {* Hopcy : 9/02/2024 *}
      <div class="flex justify-between items-center md:inline-block" @click="linksGroup{$linkBlock.id}IsOpen = !linksGroup{$linkBlock.id}IsOpen">
        <p class="text-base font-normal md:font-bold md:text-lg">{$linkBlock.title}</p>
        <button @click="linksGroup{$linkBlock.id}IsOpen = !linksGroup{$linkBlock.id}IsOpen" class="md:hidden">
          <svg class="transform transition-transfom duration-300" :class="linksGroup{$linkBlock.id}IsOpen ? 'rotate-180' : ''" xmlns="http://www.w3.org/2000/svg" height="10" viewBox="0 0 8.024 5.982">
            <path id="Tracé_1348" data-name="Tracé 1348" d="M9341.332,1216l3.316,4.786,3.315-4.786" transform="translate(-9340.636 -1215.304)" fill="none" stroke="#191310" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/>
          </svg>      
        </button>
      </div>
      <ul class="mt-2 md:mt-3" x-show="linksGroup{$linkBlock.id}IsOpen" x-cloak>
        {foreach $linkBlock.links as $link}
          <li>
            <a
                class="text-sm hover:underline"
                id="{$link.id}-{$linkBlock.id}"
                class="{$link.class}"
                href="{$link.url}"
                {* title="{$link.description}" *}
                {if !empty($link.target)} target="{$link.target}" {/if}
            >
              {$link.title}
            </a>
          </li>
        {/foreach}
      </ul>
      <ul class="mt-2 md:mt-3 hidden md:block">
        {foreach $linkBlock.links as $link}
          <li class="mb-1">
            <a
                class="text-sm hover:underline"
                id="{$link.id}-{$linkBlock.id}"
                class="{$link.class}"
                href="{$link.url}"
                {* title="{$link.description}" *}
                {if !empty($link.target)} target="{$link.target}" {/if}
            >
              {$link.title}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  {/foreach}
  </div>
</div>
