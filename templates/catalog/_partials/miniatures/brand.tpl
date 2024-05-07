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

{block name='brand_miniature_item'}
  <li data-letter="{$brand.name[0]}" data-name="{$brand.name}" class="brand w-72 items-center justify-center p-5 flex flex-col space-y-4 rounded-lg border shadow-md">
    <div class="w-full border-3">
      <a href="{$brand.url}">
        <img src="{$link->getManufacturerImageLink($brand.id_manufacturer, 'brand_default')}" alt="{$brand.name}" title="{$brand.name}" loading="lazy" class="w-full h-36 object-contain object-center">
        {* <img src="{$brand.image}" alt="{$brand.name}" title="{$brand.name}" loading="lazy" class="w-full h-36 object-contain object-center"> *}
      </a>
    </div>
    <div class="w-full text-center">
      <a class="text-xl font-medium" href="{$brand.url}">{$brand.name}</a>
    </div>
  </li>
  <style>
    .brand .border-3 {
      border-bottom: 3px solid #CEA0A7;
    }
    .brand:hover,
    .brand:hover .border-3 {
      border-color:#2cb1a5;
    }
  </style>
{/block}
