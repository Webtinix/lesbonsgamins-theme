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
 {block name='page_content'}
  {block name='login_form_container'}
  <div class="custom-checkout-step {if $page.page_name != "authentication"}p-4 border{else} {/if}">
    <div class="max-w-lg mx-auto mb-3">
      {* {if isset($found_email) && $found_email != ""}
        <div class="grid grid-cols-1 space-y-1 relative ">
          <label class="text-black text-base  required" for="field-password">
              <span class="ml-3 ">Adresse Email</span>
          </label>
          <div class="grid grid-cols-1 input-group relative">
            <div class="w-full border rounded-full border-black py-3.5 px-4 text-black">{$found_email}</div>
          </div>
        </div>
      {/if} *}
      <div class="">
        <section class="login-form">
          {render file='customer/_partials/login-form.tpl' ui=$login_form found_email=$found_email}
        </section>
      </div>
    </div>
  </div>
  {/block}
{/block}
