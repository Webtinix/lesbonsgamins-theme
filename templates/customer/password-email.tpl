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

{* {block name='page_title'}
  {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
{/block} *}

{block name='page_content'}
  <form action="{$urls.pages.password}" class="flex flex-col gap-2 border rounded shadow w-full md:w-6/12 p-4 mx-auto" method="post">

    <div class="w-full">
      <ul class="ps-alert-error">
        {foreach $errors as $error}
          <li class="item">
            <i>
              <svg viewBox="0 0 24 24">
                <path fill="#fff" d="M11,15H13V17H11V15M11,7H13V13H11V7M12,2C6.47,2 2,6.5 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2M12,20A8,8 0 0,1 4,12A8,8 0 0,1 12,4A8,8 0 0,1 20,12A8,8 0 0,1 12,20Z"></path>
              </svg>
            </i>
            <p>{$error}</p>
          </li>
        {/foreach}
      </ul>
    </div>

    <div class="w-full">
      {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
    </div>

    <div class="">
      <p>{l s='Please enter the email address you used to register. You will receive a temporary link to reset your password.' d='Shop.Theme.Customeraccount'}</p>
    </div>

    <section class="w-full">
      <div class="flex flex-col gap-2">
        <label class="w-full required" for="email">{l s='Email address' d='Shop.Forms.Labels'}<span class="text-red-600">*</span></label>
        <div class="w-full email relative mb-4">
          <input 
            type="email" 
            name="email" 
            id="email" 
            value="{if isset($smarty.post.email)}{$smarty.post.email|stripslashes}{/if}" 
            placeholder="{l s='Entrer votre adresse mail' d='Shop.Theme.Customeraccount'}"
            {* class="w-full bg-transparent border-none focus:ring-0 focus:border-green-500" required> *}
            class="w-full border-b-2 pb-1.5 rounded-none text-sm focus:border-focused" required>

          <div class="absolute bottom-0 left-0 w-full h-0.5 bg-lbg-primary"></div>
        </div>
        <button id="send-reset-link" class="w-full bg-primary text-white p-2 rounded" name="submit" type="submit">
          {l s='Send reset link' d='Shop.Theme.Actions'}
        </button>
        {* <button class="form-control-submit btn btn-primary hidden-sm-up" name="submit" type="submit">
          {l s='Send' d='Shop.Theme.Actions'}
        </button> *}
      </div>
      <div class="w-full flex justify-start items-center py-2"> 
        <a id="back-to-login" href="{$urls.pages.my_account}" class="account-link">
          <span class="hover:underline text-lbg-primary">{l s='Back to login' d='Shop.Theme.Actions'}</span>
        </a>
      </div>
    </section>

  </form>
{/block}

{* {block name='page_footer'}
  <a id="back-to-login" href="{$urls.pages.my_account}" class="account-link">
    <i class="material-icons">&#xE5CB;</i>
    <span>{l s='Back to login' d='Shop.Theme.Actions'}</span>
  </a>
{/block} *}
