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
{extends file='customer/my-account.tpl'}

{block name='wx_menu_page_title'}
  {block name='page_title'}
    {l s='Your addresses' d='Shop.Theme.Customeraccount'}
  {/block}
{/block}

{block name='wx_container_menu_items'}
  <div class="pt-10 md:pt-0 grid grid-cols-1 md:grid-cols-3 gap-3 md:gap-10 gap-x-20">
  {foreach $customer.addresses as $address}
    {block name='customer_address'}
      {include file='customer/_partials/block-address.tpl' address=$address}
    {/block}
  {/foreach}
  </div>
  <div class="mt-5">
    <a href="{$urls.pages.address}" class="w-full md:w-2/5 px-6 py-1.5 border border-black hover:lbg-bg-black hover:text-white group rounded-sm text-sm flex justify-start md:justify-center items-center space-x-2">
      <svg class="text-current group-hover:text-white" xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 14 14">
        <g id="Groupe_2835" data-name="Groupe 2835" transform="translate(-1475.749 -560.5)">
          <path id="Tracé_1487" data-name="Tracé 1487" d="M-7365-13073.5v12" transform="translate(8847.75 13635)" fill="none" stroke="#191310" stroke-linecap="round" stroke-width="2"></path>
          <path id="Tracé_1488" data-name="Tracé 1488" d="M0,0V12" transform="translate(1488.75 567.5) rotate(90)" fill="none" stroke="#191310" stroke-linecap="round" stroke-width="2"></path>
        </g>
      </svg>        
      <span class="m-0 text-current">{l s='Ajouter une adresse' d='Shop.Theme.Actions'}</span>
    </a>
  </div>
{/block}


{* {block name='page_title'}
  {l s='Your addresses' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {foreach $customer.addresses as $address}
    <div class="col-lg-4 col-md-6 col-sm-6">
    {block name='customer_address'}
      {include file='customer/_partials/block-address.tpl' address=$address}
    {/block}
    </div>
  {/foreach}
  <div class="clearfix"></div>
  <div class="addresses-footer">
    <a href="{$urls.pages.address}" data-link-action="add-address">
      <i class="material-icons">&#xE145;</i>
      <span>{l s='Create new address' d='Shop.Theme.Actions'}</span>
    </a>
  </div>
{/block} *}
