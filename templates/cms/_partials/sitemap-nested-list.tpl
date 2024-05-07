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
 {block name='sitemap_item'}
  {* Set global var link in another var link_obj *}
  {assign var="link_obj" value=$link}

  <ul{if !empty($is_nested)} class="nested"{/if}>
    {foreach $links as $link}
      {* Retrieve id if we have a category link *}
      {assign var="id_array" value=explode('-', $link.id)}
      {if "category" == $id_array[0]}
        {assign var="id" value=$id_array[2]}
      {/if}

      {if $link.id != "stores-page"}
      <li class="p-2 border-t">
        <a id="{$link.id}" class="" 

        {* Get real category link if we id exists *}
        {if $id}
        href="{$link_obj->getCategoryLink($wx_customshop->getPsCategoryClass($id))|escape:'html':'UTF-8'}" 
        {else}
        href="{$link.url}" 
        {/if}

        title="{$link.label}">
          {$link.label}
        </a>
        {if !empty($link.children)}
          {include file='cms/_partials/sitemap-nested-list.tpl' links=$link.children is_nested=true}
        {/if}
      </li>
      {/if}
    {/foreach}
  </ul>
{/block}
