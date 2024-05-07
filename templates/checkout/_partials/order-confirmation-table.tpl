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

<div id="order-items" class="w-full max-w-3xl flex flex-col items-end space-y-8">
  <div class="w-full border-b-2 border-gray-500">
    <h3 class="text-xl font-medium pb-2">Article</h3>
  </div>
  <div class="w-full divide-y-2 border-b-2 border-gray-500 divide-gray-500">
    <div class="grid grid-cols-12 w-full divide-x divide-gray-500">
      {block name='order_items_table_head'}
      <div class="col-span-5 md:col-span-6 py-2 text-sm md:whitespace-nowrap flex items-end">{l s='Articles' d='Shop.Theme.Checkout'}</div>
      <div class="col-span-7 md:col-span-6 grid grid-cols-3 divide-x divide-gray-500">
        <div class="py-2 text-center text-sm md:whitespace-nowrap px-2 md:px-4">{l s='Unit price' d='Shop.Theme.Checkout'}</div>
        <div class="py-2 text-center text-sm md:whitespace-nowrap flex items-end justify-center md:px-4">{l s='Quantity' d='Shop.Theme.Checkout'}</div>
        <div class="py-2 text-center text-sm md:whitespace-nowrap px-2 md:px-4">{l s='Total TTC' d='Shop.Theme.Checkout'}</div>
      </div>
      {/block}
    </div>

    {block name='order_confirmation_table'}
      {foreach from=$products item=product}
        <div class="order-line grid grid-cols-12 w-full divide-x divide-gray-500">
          <div class="col-span-5 md:col-span-6 py-4 text-sm flex flex-col md:flex-row items-center gap-2">
            {if !empty($product.default_image)}
              <img class="h-20 w-20 object-contain" src="{$product.default_image.medium.url}" loading="lazy" />
            {else}
              <img class="h-20 w-20 object-contain" src="{$urls.no_picture_image.bySize.medium_default.url}" loading="lazy" />
            {/if}
            <div class="details">
              {if $add_product_link}<a href="{$product.url}" target="_blank">{/if}
                <span class="text-sm md:text-base">{$product.name}</span>
              {if $add_product_link}</a>{/if}
              {if is_array($product.customizations) && $product.customizations|count}
                {foreach from=$product.customizations item="customization"}
                  <div class="customizations">
                    <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                  </div>
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
                {/foreach}
              {/if}
              {hook h='displayProductPriceBlock' product=$product type="unit_price"}
            </div>
          </div>
          <div class="col-span-7 md:col-span-6 grid grid-cols-3 divide-x divide-gray-500">
            <div class="flex items-center justify-center text-sm p-4">{$product.price}</div>
            <div class="flex items-center justify-center text-sm p-4">{$product.quantity}</div>
            <div class="flex items-center justify-center text-sm p-4">{$product.total}</div>
          </div>
        </div>
      {/foreach}
    {/block}
  </div>

  <div class="w-full max-w-sm">
    <div class="border-t-2 flex flex-col space-y-1 pt-2 border-gray-500">
      {foreach $subtotals as $subtotal}
        {if $subtotal.type === "products"}
        <div class="flex justify-between px-2 text-sm">
          <span>Sous-total</span>
          <span>{$subtotal.value}</span>
        </div>
        {/if}
      {/foreach}

      {foreach $subtotals as $subtotal}
        {if $subtotal.type === "shipping"}
        <div class="flex justify-between px-2 text-sm">
          <span>Frais de livraison</span>
          <span>{$subtotal.value}</span>
        </div>
        {/if}
      {/foreach}

      {if $subtotals.tax !== null && $subtotals.tax.label !== null}
        {* {l s='%label%:' sprintf=['%label%' => $subtotals.tax.label] d='Shop.Theme.Global'} *}
        <div class="flex justify-between px-2 text-xs text-gray-400">
          <span>Dont TVA</span>
          <span>{$subtotals.tax.value}</span>
        </div>
      {/if}
      {* <div class="flex justify-between px-2 text-xs text-gray-400">
        <span>Dont éco-participation</span>
        <span>Sous-total</span>
      </div> *}
    </div>
    <div class="border-t-2 flex flex-col space-y-1 pt-2 mt-2 border-gray-500">
      {* <div class="flex justify-between px-2 text-sm">
        <span>Bon d'achat</span>
        <span>- 5 €</span>
      </div> *}
      {foreach $subtotals as $subtotal}
        {if 'discount' == $subtotal.type && $subtotal.value}
          <div class="flex justify-between px-2 text-sm">
            <span>Code promo / carte cadeau</span>
            <span>-&nbsp;{$subtotal.value}</span>
          </div>
        {/if}
      {/foreach}
      <div class="flex justify-between px-2 text-sm">
        <span>Total TTC</span>
        <span>{$totals.total.value}</span>
      </div>
    </div>
  </div>
</div>


<div id="order-items" class="col-md-12 hidden">
  <div class="row">
    {block name='order_items_table_head'}
      <h3 class="card-title h3 col-md-6 col-12">{l s='Order items' d='Shop.Theme.Checkout'}</h3>
      <h3 class="card-title h3 col-md-2 text-md-center _desktop-title">{l s='Unit price' d='Shop.Theme.Checkout'}</h3>
      <h3 class="card-title h3 col-md-2 text-md-center _desktop-title">{l s='Quantity' d='Shop.Theme.Checkout'}</h3>
      <h3 class="card-title h3 col-md-2 text-md-center _desktop-title">{l s='Total products' d='Shop.Theme.Checkout'}</h3>
    {/block}
  </div>

  <div class="order-confirmation-table">

    {block name='order_confirmation_table'}
      {foreach from=$products item=product}
        <div class="order-line row">
          <div class="col-sm-2 col-xs-3">
            <span class="image">
              {if !empty($product.default_image)}
                <img src="{$product.default_image.medium.url}" loading="lazy" />
              {else}
                <img src="{$urls.no_picture_image.bySize.medium_default.url}" loading="lazy" />
              {/if}
            </span>
          </div>
          <div class="col-sm-4 col-xs-9 details">
            {if $add_product_link}<a href="{$product.url}" target="_blank">{/if}
              <span>{$product.name}</span>
            {if $add_product_link}</a>{/if}
            {if is_array($product.customizations) && $product.customizations|count}
              {foreach from=$product.customizations item="customization"}
                <div class="customizations">
                  <a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
                </div>
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
              {/foreach}
            {/if}
            {hook h='displayProductPriceBlock' product=$product type="unit_price"}
          </div>
          <div class="col-sm-6 col-xs-12 qty">
            <div class="row">
              <div class="col-xs-4 text-sm-center text-xs-left">{$product.price}</div>
              <div class="col-xs-4 text-sm-center">{$product.quantity}</div>
              <div class="col-xs-4 text-sm-center text-xs-right bold">{$product.total}</div>
            </div>
          </div>
        </div>
      {/foreach}

      <hr>

      <table>
        {foreach $subtotals as $subtotal}
          {if $subtotal !== null && $subtotal.type !== 'tax' && $subtotal.label !== null}
            <tr>
              <td>{$subtotal.label}</td>
              <td>{if 'discount' == $subtotal.type}-&nbsp;{/if}{$subtotal.value}</td>
            </tr>
          {/if}
        {/foreach}

        {if !$configuration.display_prices_tax_incl && $configuration.taxes_enabled}
          <tr>
            <td><span class="text-uppercase">{$totals.total.label}&nbsp;{$labels.tax_short}</span></td>
            <td>{$totals.total.value}</td>
          </tr>
          <tr class="total-value font-weight-bold">
            <td><span class="text-uppercase">{$totals.total_including_tax.label}</span></td>
            <td>{$totals.total_including_tax.value}</td>
          </tr>
        {else}
          <tr class="total-value font-weight-bold">
            <td><span class="text-uppercase">{$totals.total.label}&nbsp;{if $configuration.taxes_enabled}{$labels.tax_short}{/if}</span></td>
            <td>{$totals.total.value}</td>
          </tr>
        {/if}
        {if $subtotals.tax !== null && $subtotals.tax.label !== null}
          <tr class="sub taxes">
            <td colspan="2"><span class="label">{l s='%label%:' sprintf=['%label%' => $subtotals.tax.label] d='Shop.Theme.Global'}</span>&nbsp;<span class="value">{$subtotals.tax.value}</span></td>
          </tr>
        {/if}
      </table>
    {/block}

  </div>
</div>
