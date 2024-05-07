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

{if $pagination.pages|count > 1}
<nav class="pagination">
  <div class="mt-4">
    {block name='pagination_page_list'}
     {if $pagination.should_be_displayed}
        <ul class="page-list clearfix flex justify-end space-x-1">
          {foreach from=$pagination.pages item="page"}
            {if $page.type !== 'previous' && $page.type !== 'next'}
            <li class="">
              {if $page.type === 'spacer'}
                <span class="flex space-x-1 mt-4">
                  <span class="h-1 w-1 rounded-full bg-lbg-primary"></span>             
                  <span class="h-1 w-1 rounded-full bg-lbg-primary"></span>             
                  <span class="h-1 w-1 rounded-full bg-lbg-primary"></span>             
                </span>
              {else}
                <a
                  rel="nofollow"
                  href="{$page.url}"
                  class="{['disabled' => !$page.clickable, 'js-search-link' => true]|classnames} py-2 px-3 rounded-sm text-white"
                  style="background: {if $page.current} rgb(0, 163, 150) {else} rgba(0, 163, 150, 0.4) {/if};"
                >
                  {$page.page}
                </a>
              {/if}
            </li>
            {/if}
          {/foreach}
        </ul>
      {/if}
    {/block}
  </div>
</nav>
{/if}
