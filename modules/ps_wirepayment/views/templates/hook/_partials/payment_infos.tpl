{**
 * 2007-2020 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

<div class="w-full divide-y-2 border-b-2 border-gray-500 divide-gray-500 mt-4">
    <div class="grid grid-cols-12 w-full divide-x-2 divide-gray-500">
        <div class="col-span-4 py-2 pl-0 pr-4 md:px-6 text-sm">{l s='Amount' d='Modules.Wirepayment.Shop'}</div>
        <div class="col-span-8 py-2 px-4 md:px-6 text-sm">{$total}</div>
    </div>
    <div class="grid grid-cols-12 w-full divide-x-2 divide-gray-500">
        <div class="col-span-4 py-4 pl-0 pr-4 md:px-6 text-sm flex items-center">{l s='Name of account owner' d='Modules.Wirepayment.Shop'}</div>
        <div class="col-span-8 py-4 px-4 md:px-6 text-sm flex items-center">{$bankwireOwner}</div>
    </div>
    <div class="grid grid-cols-12 w-full divide-x-2 divide-gray-500">
        <div class="col-span-4 py-4 pl-0 pr-4 md:px-6 text-sm flex items-center">{l s='Please include these details' d='Modules.Wirepayment.Shop'}</div>
        <div class="col-span-8 py-4 px-4 md:px-6 text-sm flex items-center">{$bankwireDetails nofilter}</div>
    </div>
    <div class="grid grid-cols-12 w-full divide-x-2 divide-gray-500">
        <div class="col-span-4 py-4 pl-0 pr-4 md:px-6 text-sm flex items-center">{l s='Bank name' d='Modules.Wirepayment.Shop'}</div>
        <div class="col-span-8 py-4 px-4 md:px-6 text-sm flex items-center">{$bankwireAddress nofilter}</div>
    </div>
</div>

{* <dl>
    <dt>{l s='Amount' d='Modules.Wirepayment.Shop'}</dt>
    <dd>{$total}</dd>
    <dt>{l s='Name of account owner' d='Modules.Wirepayment.Shop'}</dt>
    <dd>{$bankwireOwner}</dd>
    <dt>{l s='Please include these details' d='Modules.Wirepayment.Shop'}</dt>
    <dd>{$bankwireDetails nofilter}</dd>
    <dt>{l s='Bank name' d='Modules.Wirepayment.Shop'}</dt>
    <dd>{$bankwireAddress nofilter}</dd>
</dl> *}
