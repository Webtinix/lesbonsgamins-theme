{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2019 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<ul class="blockreassurance_product grid md:grid-cols-2 gap-6 gap-y-3 mt-5">
    {foreach from=$blocks item=$block key=$key}
        <li class="flex items-center space-x-3">
            <div class="p-1 h-12 w-12 md:h-14 md:w-14 rounded-full border border-lbg-complementary flex items-center justify-center">
                {if $block['icon'] != 'undefined'}
                    {if $block['custom_icon']}
                        <img class="w-[70%] m-auto {if $block['is_svg']}{/if}" src="{$block['custom_icon']}" alt="{$block['description'] nofilter}" title="{$block['description'] nofilter}" />
                    {elseif $block['icon']}
                        <img class="w-[70%] m-auto" src="{$block['icon']}" alt="{$block['description'] nofilter}" title="{$block['description'] nofilter}" />
                    {/if}
                {/if}
            </div>
            <div class="flex-1">
                {if !empty($block['description'])}
                    {if $block.type_link === "0"}
                        {$block['description'] nofilter}
                    {else}
                        <a class="" href="{$block.link}" {if $block.type_link === "2" && !($block.link|strstr:'tel:' && $block.link|strpos:'tel:' === 0)}target="_blank"{/if}>
                            {$block['description'] nofilter}
                        </a>
                    {/if}
                {/if}
            </div>
        </li>
    {/foreach}
</ul>
