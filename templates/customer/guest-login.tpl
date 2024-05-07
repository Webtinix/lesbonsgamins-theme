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
  
{/block}

{block name='page_content'}

<div class="custom-checkout-step m-4 md:m-0 max-w-xl mx-auto md:p-8 md:rounded-lg bg-white md:shadow-lg">
<div class="mx-auto px-4" style="max-width: 85rem;">
  <form id="guestOrderTrackingForm" action="{$urls.pages.guest_tracking}" method="get">
    <header>
      {* <p>{l s='To track your order, please enter the following information:' d='Shop.Theme.Customeraccount'}</p> *}
      <h1 class="text-2xl font-bold mx-auto p-4" style="max-width: 85rem;">
        {l s='Guest Order Tracking' d='Shop.Theme.Customeraccount'}
      </h1>
    </header>

    <section class="form-fields md:w-1/2 mt-4">
    
      <input type="hidden" name="controller" value="guest-tracking" >

      <div class="col-span-12 flex flex-col space-y-2">
        {* <label class="form-control-label required">
          {l s='Order Reference:' d='Shop.Forms.Labels'}
        </label> *}
        <div class="">
          <input
            class="w-full border-b-2 pb-1.5 rounded-none my-5 text-sm focus:border-focused"
            name="order_reference"
            type="text"
            size="8"
            placeholder="{l s='Order Reference:' d='Shop.Forms.Labels'}"
            value="{if isset($smarty.request.order_reference)}{$smarty.request.order_reference}{/if}"
          >
          <div class="form-control-comment">
            {l s='For example: QIIXJXNUI or QIIXJXNUI#1' d='Shop.Theme.Customeraccount'}
          </div>
        </div>
      </div>

      <div class="col-span-12 flex flex-col space-y-2">
        {* <label class="form-control-label required">
          {l s='Email:' d='Shop.Forms.Labels'}
        </label> *}
        <div class="">
          <input
            class="w-full border-b-2 pb-1.5 rounded-none text-sm focus:border-focused"
            name="email"
            type="email"
            placeholder="{l s='Entrer votre adresse mail:' d='Shop.Forms.Labels'}"
            value="{if isset($smarty.request.email)}{$smarty.request.email}{/if}"
          >
        </div>
      </div>

    </section>

    <footer class="form-footer text-sm-center clearfix mt-4">
      {* <button class="w-full md:w-1/4 bg-lbg-primary text-white p-2 rounded" type="submit"> *}
      <button class="bg-lbg-primary text-white px-12 text-sm cursor-pointer py-2 rounded-sm" type="submit">
        {l s='Send' d='Shop.Theme.Actions'}
      </button>
    </footer>
  </form>
</div>
</div>
{/block}
