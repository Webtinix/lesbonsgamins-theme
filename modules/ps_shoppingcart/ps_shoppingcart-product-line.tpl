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

<li class="flex flex-row space-x-2 text-sm pt-3">
    <a href="{Context::getContext()->link->getProductLink( $product.id )}" class="w-auto h-auto">
        <img 
            src="{$product.default_image.bySize.cart_default.url}" 
            class="w-32 h-20 object-contain" 
            alt="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}" 
            title="{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}" 
            loading="lazy"
        />
    </a>
    <div class="text-black">
        <p class="font-medium text-xl">{$product.price}</p>
        <p class="mt-1 text-sm">
            <a class="" href="{Context::getContext()->link->getProductLink( $product.id )}">{$product.name|truncate:25:'...'}</a>
        </p>
        <p class="mt-1">Qté : {$product.quantity}</p>
    </div>
</li>
