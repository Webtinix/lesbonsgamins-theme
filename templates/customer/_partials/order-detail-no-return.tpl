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
{block name='order_products_table'}
  <section class="bg-gray-100 md:bg-transparent mt-14 md:mt-0 -mx-4 md:mx-0 px-4 md:px-0 pt-4 md:pt-0">
    <h3 class="text-xl md:mt-14 md:mb-10 md:border-b-2 md:pb-2 border-silver-my-account-history">{l s='Produits' d='Shop.Theme.Customeraccount'}</h3>
    <div class="md:hidden pb-5 md:pb-0 text-base">{l s='Mode de paiement' d='Shop.Theme.Catalog'} : {$order.details.payment}</div>
    <table id="order-products" class="table table-labeled hidden-sm-down">
      <thead>
        <tr>
          <th class="border-silver-my-account-history text-left font-normal p-2 px-0 border-r-2">{l s='Articles' d='Shop.Theme.Catalog'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">{l s='Prix unitaire' d='Shop.Theme.Catalog'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">{l s='Quantité' d='Shop.Theme.Catalog'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-l-2">{l s='Total TTC' d='Shop.Theme.Catalog'}</th>
        </tr>
      </thead>
      {foreach from=$order.products item=product}
        <tr>
          <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">
            <div class="flex justify-start items-center">
              <img class="m-1"
              src="{$product.default_image.bySize.small_default.url}" 
              {if !empty($product.default_image.legend)}
                alt="{$product.default_image.legend}" title="{$product.default_image.legend}" {else} alt="{$product.name}" 
              {/if}
              loading="lazy" width="{$product.default_image.bySize.small_default.width}"
              height="{$product.default_image.bySize.small_default.height}" 
              width="{$product.default_image.bySize.small_default.width}">
              <a 
              class="p-3 text-base"
              {if isset($product.download_link)}href="{$product.download_link}"{/if}>
                  {$product.name}
              </a>
            </div>
            {* {if $product.product_reference}
              {l s='Reference' d='Shop.Theme.Catalog'}: {$product.product_reference}<br/>
            {/if} *}
            {if $product.customizations}
              {foreach from=$product.customizations item="customization"}
                <div class="customization">
                  <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                </div>
                <div id="_desktop_product_customization_modal_wrapper_{$customization.id_customization}">
                  <div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
                            <span aria-hidden="true">&times;</span>
                          </button>
                          <h4 class="modal-title">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
                        </div>
                        <div class="modal-body">
                          {foreach from=$customization.fields item="field"}
                            <div class="product-customization-line row">
                              <div class="col-sm-3 col-xs-4 label">
                                {$field.label}
                              </div>
                              <div class="col-sm-9 col-xs-8 value">
                                {if $field.type == 'text'}
                                  {if (int)$field.id_module}
                                    {$field.text nofilter}
                                  {else}
                                    {$field.text}
                                  {/if}
                                {elseif $field.type == 'image'}
                                  <img src="{$field.image.small.url}" loading="lazy">
                                {/if}
                              </div>
                            </div>
                          {/foreach}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              {/foreach}
            {/if}
          </td>
          <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">{$product.price}</td>
          <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-r-2">
            {if $product.customizations}
              {foreach $product.customizations as $customization}
                {$customization.quantity}
              {/foreach}
            {else}
              {$product.quantity}
            {/if}
          </td>
          <td class="border-silver-my-account-history text-center font-normal p-5 border-b-2 border-t-2 border-l-2">{$product.total}</td>
        </tr>
      {/foreach}
      <tfoot>
        <tr>
          <td></td>
          <td colspan="3">
            <div class="my-5 border-silver-my-account-history border-t-2 py-3">
              {foreach $order.subtotals as $line}
                {if $line.value}
                  <div class="py-1 px-5 flex justify-between text-xs-right line-{$line.type}">
                    <div colspan="2">{$line.label}</div>
                    <div>{$line.value}</div>
                  </div>
                {/if}
              {/foreach}
              <div class="border-silver-my-account-history border-t-2 my-3 px-5 flex justify-between text-xs-right line-{$order.totals.total.type}">
                <div colspan="2">{$order.totals.total.label}</div>
                <div>{$order.totals.total.value}</div>
              </div>
            </div>
          </td>
        </tr>
      </tfoot>
    </table>
    <div class="bg-gray-100 hidden-md-up">
      {foreach from=$order.products item=product}
        <div class="border-b-2 pb-5">
          <div class="">
            <div class="mt-2 flex justify-start">
              <div class="flex flex-col w-1/5">
                <img
                src="{$product.default_image.bySize.small_default.url}" 
                {if !empty($product.default_image.legend)}
                  alt="{$product.default_image.legend}" title="{$product.default_image.legend}" {else} alt="{$product.name}" 
                {/if}
                loading="lazy" width="{$product.default_image.bySize.small_default.width}"
                height="{$product.default_image.bySize.small_default.height}" 
                width="{$product.default_image.bySize.small_default.width}">
              </div>
              <div class="flex flex-col w-4/5">
                <div class="p-3">
                  <a 
                  class="text-base"
                  {if isset($product.download_link)}href="{$product.download_link}"{/if}>
                      {$product.name}
                  </a>
                </div>
              </div>
            </div>
            <div class="mt-2 flex justify-start">
              <div class="flex flex-col w-1/5">
                {l s='Prix unit' d='Shop.Theme.Catalog'}
                {$product.price}
              </div>
              <div class="flex flex-col w-4/5">
                <div class="flex justify-between">
                    <div class="w-1/2 flex justify-center">
                      <div class="flex flex-col">
                        <span class="font-bold">{l s='Quantité' d='Shop.Theme.Catalog'}</span>
                        <span>
                          {if $product.customizations}
                            {foreach $product.customizations as $customization}
                              {$customization.quantity}
                            {/foreach}
                          {else}
                            {$product.quantity}
                          {/if}
                        </span>
                      </div>
                    </div>
                    <div class="w-1/2 flex justify-end">
                      <div class="flex flex-col">
                        <span class="font-bold">{l s='Total TTC' d='Shop.Theme.Catalog'}</span>
                        <span>{$product.total}</span>
                      </div>
                    </div>
                </div>
              </div>
            </div>
            {* {if $product.product_reference}
              <div class="ref">{l s='Reference' d='Shop.Theme.Catalog'}: {$product.product_reference}</div>
            {/if} *}
            {if $product.customizations}
              {foreach $product.customizations as $customization}
                <div class="customization">
                  <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                </div>
                <div id="_mobile_product_customization_modal_wrapper_{$customization.id_customization}">
                </div>
              {/foreach}
            {/if}
          </div>
          <div class="col-sm-7 qty">
            <div class="row">
              {* <div class="text-sm-left text-xs-left">
                {$product.price}
              </div> *}
              {* <div class="col-xs-4">
                {if $product.customizations}
                  {foreach $product.customizations as $customization}
                    {$customization.quantity}
                  {/foreach}
                {else}
                  {$product.quantity}
                {/if}
              </div>
              <div class="text-xs-right">
                {$product.total}
              </div> *}
            </div>
          </div>
        </div>
      {/foreach}
      <div class="bg-gray-100 mt-10">
        {foreach $order.subtotals as $line}
          {if $line.value}
            <div class="flex justify-between px-2">
              <div class="">{$line.label}</div>
              <div class="text-right">{$line.value}</div>
            </div>
          {/if}
        {/foreach}
        <div class="flex justify-between px-2 pt-3 pb-10 border-t-2 border-black">
          <div class="">{$order.totals.total.label}</div>
          <div class="text-right">{$order.totals.total.value}</div>
        </div>
      </div>
    </div>
  </section>

{/block}
