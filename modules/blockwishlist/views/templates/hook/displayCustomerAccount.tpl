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

{assign var="total" value={hook h='wx_totalwishlist'}}
{assign var="total" value=intval(preg_replace('/[^0-9]+/', '', $total), 10)}
<a id="wishlist-link" href="{$link->getModuleLink('blockwishlist', 'lists')|escape:'html':'UTF-8'}" class="relative mr-1">
    <svg xmlns="http://www.w3.org/2000/svg" class="h-7 md:h-8" viewBox="0 0 28.32 39.22">
        <path fill="#00A194" d="M21.95,38.7c-0.2,0-0.39-0.07-0.56-0.2c-0.22-0.19-0.53-0.44-0.92-0.76c-1.64-1.35-4.43-3.65-7.41-6.37  c-1.82,2.44-3.21,4.21-3.7,4.83c-0.3,0.37-0.84,0.44-1.21,0.14c-0.37-0.3-0.44-0.84-0.14-1.21c1.02-1.28,2.32-2.99,3.77-4.94  c-5.29-4.97-10.71-11-11.03-15.23c-0.1-1.28,0.25-2.36,1.03-3.23c0.93-1.03,2.09-1.58,3.45-1.62c3.25-0.09,6.82,2.76,8.57,4.39  c1.34-3.79,4.5-11.45,8.72-13.14c1.3-0.52,2.58-0.45,3.83,0.2c0.77,0.4,1.29,1.11,1.49,2.04c1.09,5.11-7.84,18.35-13.73,26.37  c2.18,2,4.67,4.15,7.47,6.45c0.4,0.33,0.71,0.59,0.94,0.78c0.36,0.31,0.41,0.85,0.1,1.22C22.44,38.6,22.2,38.7,21.95,38.7z   M5.42,11.82c-0.04,0-0.09,0-0.13,0c-0.88,0.03-1.61,0.37-2.22,1.05c-0.46,0.51-0.65,1.14-0.59,1.94c0.22,3.02,3.7,7.69,10.34,13.94  c6.21-8.52,14.2-20.7,13.32-24.82c-0.12-0.56-0.4-0.77-0.6-0.87c-0.79-0.41-1.57-0.45-2.39-0.12c-3.09,1.24-6.12,7.36-7.92,12.67  c-0.15,0.44-0.5,0.76-0.95,0.87c-0.45,0.11-0.92-0.02-1.25-0.35C11.98,15.12,8.35,11.82,5.42,11.82z"/>
    </svg>
    <div class="absolute -bottom-1 left-4 bg-2cb1a5 inline-flex rounded-full h-4 w-4 text-xs justify-center font-medium text-white items-center">
        <span class="text-white" style="font-size: 10px;">{hook h='wx_totalwishlist'}</span>
    </div>
</a>