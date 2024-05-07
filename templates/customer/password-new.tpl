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
  {l s='Reset your password' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
    <form action="{$urls.pages.password}" method="post">
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
    {* form-fields renew-password  -->ceci est la classe que j'ai retiré dans cette section ! *}
    {* APres j'ai mis ceci  --> mx-auto relative md:py-5 px-2 md:px-4 *}
      <section class="flex flex-col gap-2 border rounded shadow w-full md:w-6/12 p-4 mx-auto">

        <div class="email">
          {l
            s='Email address: %email%'
            d='Shop.Theme.Customeraccount'
            sprintf=['%email%' => $customer_email|stripslashes]}
        </div>

        {* <div class="container-fluid">
          <div class="row form-group">
            <label class="form-control-label col-md-3 offset-md-2">{l s='New password' d='Shop.Forms.Labels'}</label>
            <div class="col-md-4">
              <input class="w-full border-b-2 pb-1.5 rounded-none text-sm focus:border-focused" type="password" data-validate="isPasswd" name="passwd" value="">
            </div>
          </div> *}

          <div class="w-full email relative mb-4">
            <input 
              type="password" 
              name="passwd" 
              data-validate="isPasswd"
              value="" 
              placeholder="{l s='New password' d='Shop.Forms.Labels'}"
              {* class="w-full bg-transparent border-none focus:ring-0 focus:border-green-500" required> *}
              class="w-full border-b-2 pb-1.5 rounded-none text-sm focus:border-focused" required>
              <span class="text_mdp_non_valide_form_choisir_mdp hidden text-red-500 text-xs "></span>
              <p class="text-sm md:w-10/12">Le mot de passe doit contenir au moins 8 caractères, 1 minuscule, 1 majuscule, 1 chiffre et 1 caractère spécial.</p>
            {* <div class="absolute bottom-0 left-0 w-full h-0.5 bg-lbg-primary"></div> *}

          </div>

          {* <div class="row form-group">
            <label class="form-control-label col-md-3 offset-md-2">{l s='Confirmation' d='Shop.Forms.Labels'}</label>
            <div class="col-md-4">
              <input class="w-full border-b-2 pb-1.5 rounded-none text-sm focus:border-focused" type="password" data-validate="isPasswd" name="confirmation" value="">
            </div>
          </div> *}

          <div class="w-full email relative mb-4">
            <input 
              type="password" 
              name="confirmation" 
              data-validate="isPasswd"
              value="" 
              placeholder="{l s='Confirmation' d='Shop.Forms.Labels'}"
              {* class="w-full bg-transparent border-none focus:ring-0 focus:border-green-500" required> *}
              class="w-full border-b-2 pb-1.5 rounded-none text-sm focus:border-focused" required>
              <span class="text_mdp_non_valide_form_choisir_mdp hidden text-red-500 text-xs "></span>
              {* <p class="text-sm md:w-10/12">Le mot de passe doit contenir au moins 1 minuscule, 1 majuscule, 1 chiffre et 1 caractère spécial.</p> *}
            {* <div class="absolute bottom-0 left-0 w-full h-0.5 bg-lbg-primary"></div> *}
          </div>
          {* <div class="absolute bottom-0 left-0 w-full h-0.5 bg-lbg-primary"></div> *}

          <input type="hidden" name="token" id="token" value="{$customer_token}">
          <input type="hidden" name="id_customer" id="id_customer" value="{$id_customer}">
          <input type="hidden" name="reset_token" id="reset_token" value="{$reset_token}">

          <div class="row form-group p-3">
            {* <div class="offset-md-5"> *}
              <button class="w-full bg-primary text-white p-2 rounded" type="submit" name="submit">
                {l s='Change Password' d='Shop.Theme.Actions'}
              </button>
            {* </div> *}
            <div class="w-full flex justify-start items-center py-2"> 
              <a href="{$urls.pages.authentication}">{l s='Back to Login' d='Shop.Theme.Actions'}</a>
            </div>
          </div>
        </div>
      </section>
    </form>
{/block}

{* {block name='page_footer'}
  <ul>
    <li><a href="{$urls.pages.authentication}">{l s='Back to Login' d='Shop.Theme.Actions'}</a></li>
  </ul>
{/block} *}
