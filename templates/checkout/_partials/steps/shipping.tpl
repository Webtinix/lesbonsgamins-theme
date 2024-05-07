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
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <div class="md:border-b pb-4 mb-2 md:mb-6 border-gray-400">
    <h1 class="text-3xl md:text-4xl font-bold">
      <span class="hidden md:block">{l s='Choisir le mode de livraison' d='Shop.Theme.Checkout'}</span>
      <span class="md:hidden">{l s='Mode de livraison' d='Shop.Theme.Checkout'}</span>
    </h1>
  </div>

  <div id="hook-display-before-carrier">
    {$hookDisplayBeforeCarrier nofilter}
  </div>

  <script>
  $(document).ready(function() {
    $('.delivery-options-list input[type="radio"]').change(function() {
      $('.delivery-options-list .js-delivery-option').removeClass('selected')
      if ($(this).is(':checked')) {
        $(this).closest('.js-delivery-option').addClass('selected')
      }
    });
  });
  </script>

  <div class="delivery-options-list">
    {if $delivery_options|count}
      <form
        class="clearfix"
        id="js-delivery"
        data-url-update="{url entity='order' params=['ajax' => 1, 'action' => 'selectDeliveryOption']}"
        method="post"
      >
        <div class="form-fields">
          {block name='delivery_options'}
            <div class="delivery-options col-span-12">
              {foreach from=$delivery_options item=carrier key=carrier_id}
                  <div class="{if $delivery_option == $carrier_id} selected{/if} flex flex-col delivery-option js-delivery-option py-2 px-3 border rounded-sm border-gray-400" style="min-height: auto;">
                    <label for="delivery_option_{$carrier.id}" class="w-full delivery-option-2">
                      <div class="flex justify-between">
                        <div class="flex-1 grid grid-cols-1 md:grid-cols-2">
                          <div class="flex items-center">
                            <div class="">
                              <span class="custom-radio float-xs-left">
                                <input type="radio" name="delivery_option[{$id_address}]" id="delivery_option_{$carrier.id}" value="{$carrier_id}"{if $delivery_option == $carrier_id} checked{/if}>
                                <span></span>
                              </span>
                            </div>
                            <div class="carriere-name-container">
                              <span class="carrier-name text-sm">{$carrier.name}</span>
                            </div>
                          </div>
                          <div class="ml-6 md:ml-0">
                            <span class="carrier-delay text-sm">{$carrier.delay}</span>
                          </div>
                        </div>
                        <div class="md:w-28 flex justify-end ">
                          {if $carrier.price == "offerte"}
                            <span class="carrier-price text-sm whitespace-nowrap">Gratuit</span>
                          {else}
                            <span class="carrier-price text-sm whitespace-nowrap">{$carrier.price}</span>
                          {/if}
                        </div>
                      </div>
                    </label>
                  </div>
                  <div class="carrier-extra-content js-carrier-extra-content"{if $delivery_option != $carrier_id} style="display:none;"{/if}>
                    {$carrier.extraContent nofilter}
                  </div>
                  <div class="clearfix"></div>
              {/foreach}
            </div>
          {/block}
          <div class="order-options col-span-12">
            <div id="delivery">
              <label for="delivery_message" class="text-sm">{l s='If you would like to add a comment about your order, please write it in the field below.' d='Shop.Theme.Checkout'}</label>
              <textarea class="border border-gray-400 text-sm" rows="1" cols="120" id="delivery_message" name="delivery_message">{$delivery_message}</textarea>
            </div>

            {if $recyclablePackAllowed}
              <span class="custom-checkbox">
                <input type="checkbox" id="input_recyclable" name="recyclable" value="1" {if $recyclable} checked {/if}>
                <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                <label for="input_recyclable">{l s='I would like to receive my order in recycled packaging.' d='Shop.Theme.Checkout'}</label>
              </span>
            {/if}

            {if $gift.allowed}
              <span class="custom-checkbox">
                <input class="js-gift-checkbox" id="input_gift" name="gift" type="checkbox" value="1" {if $gift.isGift}checked="checked"{/if}>
                <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
                <label for="input_gift">{$gift.label}</label >
              </span>

              <div id="gift" class="collapse{if $gift.isGift} in{/if}">
                <label for="gift_message">{l s='If you\'d like, you can add a note to the gift:' d='Shop.Theme.Checkout'}</label>
                <textarea rows="2" cols="120" id="gift_message" name="gift_message">{$gift.message}</textarea>
              </div>
            {/if}

          </div>
        </div>
        <button type="submit" class="continue bg-lbg-primary hover:bg-primary text-white px-4 py-3 md:py-2 w-full lg:w-1/2 rounded-sm text-sm" name="confirmDeliveryOption" value="1">
          {l s='Continuer vers le paiement' d='Shop.Theme.Actions'}
        </button>
      </form>
    {else}
      <p class="alert alert-danger">{l s='Unfortunately, there are no carriers available for your delivery address.' d='Shop.Theme.Checkout'}</p>
    {/if}
  </div>

  <div id="hook-display-after-carrier">
    {$hookDisplayAfterCarrier nofilter}
  </div>

  <div id="extra_carrier"></div>
{/block}
