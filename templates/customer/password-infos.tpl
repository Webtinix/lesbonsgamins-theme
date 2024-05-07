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
{extends file='customer/page.tpl'}

{block name='page_content'}
  <div class="flex w-full">
    <div class="flex flex-col gap-4 bg-white border rounded shadow w-full md:w-6/12 p-4 mx-auto">
      <span>
        {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
      </span>
      <ul class="ps-alert-success p-0">
        {foreach $successes as $success}
          <li class="item">
            <i>
              <svg viewBox="0 0 24 24">
                <path fill="#fff" d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z" />
              </svg>
            </i>
            <p>{$success}</p>
          </li>
        {/foreach}
      </ul>

      <div class="w-full flex justify-start items-center py-2"> 
        <a id="back-to-login" href="{$urls.pages.my_account}" class="account-link">
          <span class="hover:underline text-lbg-primary">{l s='Back to login' d='Shop.Theme.Actions'}</span>
        </a>
      </div>
    </div>
  </div>
{/block}
