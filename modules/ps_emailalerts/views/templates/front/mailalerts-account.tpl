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
{extends file='customer/my-account.tpl'}

{block name='wx_menu_page_title'}
  <div class="flex flex-col">
    <div class="text-2xl">{l s='Mes alertes' d='Modules.Emailalerts.Shop'}</div>
    <p class="text-xs">{l s='Produits pour lesquels vous avez demandé à recevoir un email lors du retour en stock' d='Modules.Emailalerts.Shop'}</p>
  </div>
{/block}

{block name='wx_container_menu_items'}
  {if $mailAlerts}
    <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
      {foreach from=$mailAlerts item=mailAlert}
        {* <li class="p-1 m-1" style="display:flex;align-items:center;background:white"> *}
          {include 'module:ps_emailalerts/views/templates/front/mailalerts-account-line.tpl' mailAlert=$mailAlert}
        {* </li> *}
      {/foreach}
    </div>
  {else}
    <div class="alert alert-info" role="alert" data-alert="info">{l s='No mail alerts yet.' d='Modules.Emailalerts.Shop'}</div>
  {/if}
{/block}
