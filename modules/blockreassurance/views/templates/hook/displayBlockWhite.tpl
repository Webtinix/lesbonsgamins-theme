{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License version 3.0
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License version 3.0
 *}
 {* <div class="blockreassurance  py-16  grid grid-cols-2 md:grid-cols-4 gap-10 "> *}
 <ul class="py-10 md:py-20 grid grid-cols-2 md:grid-cols-4 gap-6 lg:gap-10 px-4 lg:px-0">
 {assign var=numCols value=$blocks|@count}
 {assign var=numColsRemaining_md value=($numCols % 4)}
 {assign var=numColsRemaining_sm value=($numCols % 2)}
 {foreach from=$blocks item=$block key=$key name=blocks}
     {assign var=idxCol value=($smarty.foreach.blocks.index + 1)}
     {assign var=sizeCol_md value=3}
     {assign var=offsetCol_md value="offset-md-0"}
     {assign var=sizeCol_sm value=6}
     {assign var=offsetCol_sm value="offset-sm-0"}
     {if $idxCol > ($numCols - $numColsRemaining_md)}
         {if $numColsRemaining_md == 2}
             {if !$smarty.foreach.blocks.last}
                 {assign var=offsetCol_md value="offset-md-3"}
             {/if}
         {else}
             {assign var=sizeCol_md value=(12 / $numColsRemaining_md)}
         {/if}
     {/if}
     {if $idxCol > ($numCols - $numColsRemaining_sm)}
         {if $numColsRemaining_md == 1}
             {assign var=offsetCol_sm value="offset-sm-3"}
         {else}
             {assign var=sizeCol_sm value=(12 / $numColsRemaining_md)}
         {/if}
     {/if}
    <li class="flex flex-col space-y-2 md:space-y-0 md:grid md:grid-cols-7 {if $block['position'] < $numCols}lg:border-r-2{/if} border-gray-300 md:text-start">
        <div class="row-span-2 col-span-7 md:col-span-2 grid place-content-center items-center" >
            <div class="flex items-center justify-center w-14 h-14 rounded-full border border-lbg-complementary {if $key > 0}grid{/if}">
                {if $block['icon'] != 'undefined'}
                    {if $block['custom_icon']}
                        <img class="w-[70%] m-auto {if $block['is_svg']}{/if}" src="{$block['custom_icon']}" alt="{$block['description'] nofilter}" title="{$block['description'] nofilter}" />
                    {elseif $block['icon']}
                        <img class="w-[70%] m-auto" src="{$block['icon']}" alt="{$block['description'] nofilter}" title="{$block['description'] nofilter}" />
                    {/if}
                {/if}
            </div>
        </div>
        <div class="col-span-7 md:col-span-5 text-lbg-complementary font-semibold hidden lg:block">{$block['title']}</div>
        <div class="lg:-mt-2 col-span-7 md:col-span-5 md:w-[90%] text-center lg:text-left text-base lg:text-xs">
            {if $block.type_link === "0"}
                {$block['description'] nofilter}
            {else}
                <a class="" href="{$block.link}" {if $block.type_link === "2" && !($block.link|strstr:'tel:' && $block.link|strpos:'tel:' === 0)}target="_blank"{/if}>
                    {$block['description'] nofilter}
                </a>
            {/if}
        </div>
    </li>
 {/foreach}
</ul>
