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
 
{block name='product_flags'}
    <ul class="product-flags js-product-flags absolute z-10 lg:left-20 top-2 lg:pl-5">
        {block name='flags'}
            {foreach from=$product.flags item=flag}
                {if $flag.type === "discount"}
                <li class="w-5 -rotate-12">
                    <div class="text-2xl text-reded -mb-3 transform -rotate-12">{$flag.label}</div>
                    <img 
                        src="{$urls.img_url}Picto-carte-fiche-produit/Barre-chiffre-promotion.png"  
                        class="brightness-95 w-16 max-w-[none]"
                        alt="{$flag.label}" title="{$flag.label}"
                    />
                </li>
                {elseif $flag.type === "new" && (isset($product.flags.discount) && !$product.flags.discount)}
                <li class="">
                    <img 
                        src="{$urls.img_url}Picto-carte-fiche-produit/Nouveau-produit.png"  
                        class="w-auto h-14 -rotate-12"
                        alt="{$flag.label}" title="{$flag.label}"
                    />
                </li>
                {elseif $flag.type != "out_of_stock" && (isset($product.flags.discount) && !$product.flags.discount) && !$product.flags.new}
                <li class="-rotate-12">
                    <span class="product-flag px-4 {$flag.type}">{$flag.label}</span>
                </div>
                {/if}
            {/foreach}
        {/block}
    </ul>
{/block}
