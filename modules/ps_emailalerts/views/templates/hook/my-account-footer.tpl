{*
* 2007-2016 PrestaShop
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
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2015 PrestaShop SA
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

{* <li>
  <a href="{url entity='module' name='ps_emailalerts' controller='account'}">{l s='My alerts' d='Modules.Emailalerts.Shop'}</a>
</li> *}
<a 
  href="{url entity='module' name='ps_emailalerts' controller='account'}" 
  title="{l s='Mes alertes' d='Modules.Emailalerts.Shop'}"
  class="{if $page.page_name == "module-ps_emailalerts-account"} text-lbg-primary bg-white {/if} pl-1 md:pl-4 border-b-2 border-gray-400 md:border-transparent flex items-center menu-client-item justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
  {l s='Mes alertes' d='Modules.Emailalerts.Shop'}
  <svg class="opacity-100 {if $page.page_name == "module-ps_emailalerts-account"} md:opacity-100 {else} md:opacity-0 {/if} group-hover:opacity-100 transition-opacity" xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
    <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961" transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
  </svg>
</a>
