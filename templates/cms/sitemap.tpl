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
{extends file='page.tpl'}

{block name='page_title'}
  <span class="sitemap-title">{l s='Sitemap' d='Shop.Theme.Global'}</span>
{/block}

{block name='page_content_container'}
  <div class="w-ful px-4 mx-auto" style="max-width: 85rem;">
  <pre>{*$links.pages|@var_dump*}</pre>
  
    <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-4 mb-4">
        <div class="space-y-4">
          <div class="border rounded px-3">
            <h2 class="my-4">
              <a id="{$links.offers[1]['id']}" class="" href="{$links.offers[1]['url']}" title="{$links.offers[1]['label']}">
                {$links.offers[1]["label"]}
              </a>
            </h2>
            {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.offers[1]["children"]}
          </div>
          <div class="border rounded px-3">
            <h2 class="my-4">{$your_account}</h2>
            {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.user_account}
          </div>
          <div class="border rounded px-3">
            <h2 class="my-4">{$pages}</h2>
            {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.pages}
          </div>
        </div>
        <div class="space-y-4">
          <div class="border rounded px-3">
            <h2 class="my-4">
              <a id="{$links.categories[0]["children"][0]['id']}" class="" href="{$links.categories[0]["children"][0]['url']}" title="{$links.categories[0]["children"][0]['label']}">
                {$links.categories[0]["children"][0]['label']}
              </a>
            </h2>
            {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.categories[0]["children"][0]["children"]}
          </div>
          <div class="border rounded px-3">
            <h2 class="my-4">
              <a id="{$links.categories[0]["children"][1]['id']}" class="" href="{$links.categories[0]["children"][1]['url']}" title="{$links.categories[0]["children"][1]['label']}">
                {$links.categories[0]["children"][1]['label']}
              </a>
            </h2>
            {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.categories[0]["children"][1]["children"]}
          </div>
        </div>
        <div class="space-y-4">
          <div class="border rounded px-3">
            <h2 class="my-4">
              <a id="{$links.categories[0]["children"][2]['id']}" class="" href="{$links.categories[0]["children"][2]['url']}" title="{$links.categories[0]["children"][2]['label']}">
                {$links.categories[0]["children"][2]['label']}
              </a>
            </h2>
            {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.categories[0]["children"][2]["children"]}
          </div>
          <div class="border rounded px-3">
            <h2 class="my-4">
              <a id="{$links.categories[0]["children"][3]['id']}" class="" href="{$links.categories[0]["children"][3]['url']}" title="{$links.categories[0]["children"][3]['label']}">
                {$links.categories[0]["children"][3]['label']}
              </a>
            </h2>
            {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.categories[0]["children"][3]["children"]}
          </div>
        </div>
        <div class="space-y-4">
          <div class="border rounded px-3">
            <h2 class="my-4">
              <a id="{$links.categories[0]["children"][4]['id']}" class="" href="{$links.categories[0]["children"][4]['url']}" title="{$links.categories[0]["children"][4]['label']}">
                {$links.categories[0]["children"][4]['label']}
              </a>
            </h2>
            {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.categories[0]["children"][4]["children"]}
          </div>
          <div class="border rounded px-3">
            <h2 class="my-4">
              <a id="{$links.categories[0]["children"][5]['id']}" class="" href="{$links.categories[0]["children"][5]['url']}" title="{$links.categories[0]["children"][5]['label']}">
                {$links.categories[0]["children"][5]['label']}
              </a>
            </h2>
            {include file='cms/_partials/sitemap-nested-list.tpl' links=$links.categories[0]["children"][5]["children"]}
          </div>
        </div>
    </div>
  </div>
{/block}
