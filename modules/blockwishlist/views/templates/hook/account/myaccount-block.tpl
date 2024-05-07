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

{if $customer.is_logged}
  {* <li>
    <a href="{$url}" title="{$wishlistsTitlePage}" rel="nofollow">
      {$blockwishlist|escape:'html':'UTF-8'}
    <a>
  </li> *}
  
  <a 
    href="{$url}" 
    title="{$wishlistsTitlePage}"
    class="{if $page.page_name == "module-blockwishlist-lists"} text-lbg-primary bg-white {/if} pl-1 md:pl-4 border-b-2 border-gray-400 md:border-transparent flex items-center menu-client-item justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
    {l s='Mes favoris' d='Shop.Theme.Customeraccount'}
    <svg class="opacity-100 {if $page.page_name == "module-blockwishlist-lists"} md:opacity-100 {else} md:opacity-0 {/if} group-hover:opacity-100 transition-opacity" xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
      <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961" transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
    </svg>
  </a>
{/if}
