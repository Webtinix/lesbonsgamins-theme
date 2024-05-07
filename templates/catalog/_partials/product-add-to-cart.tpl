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
 {assign var="is_cadeau" value=$wx_customshop->get_acf_value('carte_cadeau', $product.id_product, 'product')}
 {assign var="reapro" value=$wx_customshop->get_acf_value('REAPRO', $product.id_product, 'product')}
 {assign var="stock_fournisseur" value=$wx_customshop->get_acf_value('stock_fournisseur', $product.id_product, 'product')}
 {assign var="qty_product" value=Product::getQuantity($product.id_product)}
 {assign var="array_for_select_qty_product_to_add" value=$wx_customshop->generateSimpleArrayForLoopFor($qty_product + $stock_fournisseur + 1)}
 {* {Product::getQuantity($product.id_product)|dump} *}
 {* {$product.available_date|dump} *}
 <div class="product-add-to-cart js-product-add-to-cart {if isset($is_quickview)}w-full{/if} flex flex-col items-center w-full">
    {if !$configuration.is_catalog}
      {* En stock ou Prochainement en stock *}
      {* {Product::getQuantity($product.id_product)|dump}
      {$reapro|dump}
      {$stock_fournisseur|dump}
      {$product.available_date|dump}
      {$wx_customshop->compareDate('', $product.available_date)|dump} 
      {$product.availability|dump}  *}
      {* La variable relative_qty_product représente la quantité du produit courant en suivant l'utilisateur courant *}
      {* Exemple, si je mets un produit au panier dont la quantité restante est de 1, si je n'ai pas encore terminé la commande,
      La quantité restante est de 0 pour moi, mais un autre utilisateur a encore la possibilité de mettre le produit au panier
      Donc il y a la quantité relative du produit et sa quantité absolue sur le site *}
      {assign var="relative_qty_product" value=Product::getQuantity($product.id_product) scope='global'}
      {if !$product.add_to_cart_url}
        {assign var="relative_qty_product" value=0 scope='global'}
      {/if}
      {assign var="state_stock" value='in_stock' scope='global'}
      {if ($relative_qty_product > 0 && $is_cadeau != 1)}
        {assign var="state_stock" value='in_stock'}
      {elseif ($relative_qty_product <= 0 && $reapro == 1 && $stock_fournisseur > 0)}
        {assign var="state_stock" value='coming_soon'}
      {elseif ($relative_qty_product <= 0 && $reapro == 1 && $stock_fournisseur <= 0 && $product.available_date != '0000-00-00' && $wx_customshop->compareDate('', $product.available_date) < 0)}
        {assign var="state_stock" value='coming_soon'}
      {elseif ($relative_qty_product <= 0 && $reapro == 1 && $stock_fournisseur <= 0 && ($product.available_date == '0000-00-00' || $wx_customshop->compareDate('', $product.available_date) > 0))}
        {assign var="state_stock" value='out_of_stock_with_alert'}
      {elseif ($relative_qty_product <= 0 && $reapro != 1)}
        {assign var="state_stock" value='out_of_stock'}
      {/if}
      {if !isset($is_quickview)}
      <div class="py-5 flex flex-col gap-4 w-full">
        <p class="before:content-[''] before:size-3 
          {if $state_stock == 'in_stock'}before:bg-green-400
          {else if  $state_stock == 'coming_soon'}before:bg-warning
          {else if  $state_stock == 'out_of_stock_with_alert'}before:bg-red-400
          {else if  $state_stock == 'out_of_stock'}before:bg-red-400
          {/if} before:block before:rounded-full flex items-center  gap-1 text-green-500 font-medium text-[.9rem]">
          {block name='product_availability'}
            {* {$product.show_availability|@var_dump}
            {$product.availability|@var_dump} *}
            {if ($product.show_availability && $product.availability)}
            <span id="product-availability" class="js-product-availability label font-medium 
              {if $state_stock == 'in_stock'}lbg-text-success
              {else if  $state_stock == 'coming_soon'}lbg-text-warning
              {else if  $state_stock == 'out_of_stock_with_alert'}text-red-600
              {else if  $state_stock == 'out_of_stock'}text-red-600
              {/if}">
              {* A revoir  *}
              {* {if $product.availability == 'available'}
              {elseif $product.availability == 'last_remaining_items'}
                {$product.availability_message}
              {else}
                {$product.availability_message}
              {/if} *}
              
              {if $state_stock == 'in_stock'}
                {l s='en stock' d='Shop.Theme.Catalog'}
              {elseif $state_stock == 'coming_soon'}
                {l s='Prochainement en stock' d='Shop.Theme.Catalog'}
              {elseif $state_stock == 'out_of_stock_with_alert'}
                {l s='Epuisé' d='Shop.Theme.Catalog'}
              {elseif $state_stock == 'out_of_stock'}
                {l s='Epuisé' d='Shop.Theme.Catalog'}
              {/if}
            </span>
            {/if}
          {/block} 
          <span class="hidden md:block text-gray-950 text-[.9rem">
            {if $state_stock != 'out_of_stock_with_alert' && $state_stock != 'out_of_stock'}
              {assign var="delivery_date" value=$wx_customshop->wx_getDeliveryDate(null, $product, true)}
              {if $delivery_date && count($delivery_date) > 1}
                - 
                {if $state_stock == 'coming_soon'}
                  {l 
                    s='Précommandez et soyez livré entre le %delivery_date_begin% et le %delivery_date_end%' 
                    d='Shop.Theme.Catalog' 
                    sprintf=[
                      '%delivery_date_begin%' => $delivery_date[0],
                      '%delivery_date_end%' => $delivery_date[1]
                    ]
                  }
                {else}  
                  {l 
                    s='Livré entre le %delivery_date_begin% et le %delivery_date_end%' 
                    d='Shop.Theme.Catalog' 
                    sprintf=[
                      '%delivery_date_begin%' => $delivery_date[0],
                      '%delivery_date_end%' => $delivery_date[1]
                    ]
                  }
                {/if}
              {/if}
            {/if}
          </span>
        </p>
      </div>
      {/if}
      {block name='product_quantity'}
        <div class="w-full product-quantity clearfix {if isset($is_quickview)}mt-4{/if}">
            {* hopcy: 08/02/2024  update style*}
            {* lbg-bg-warning  *}
          <div class="w-full flex justify-center space-x-3 {if isset($is_quickview)}w-full{/if}" style="margin:10px O;">
            <div class="add w-full flex 
                {* {if Product::getQuantity($product.id_product) <= 0 && $reapro != 1} 
                  bg-gray-500
                {else} 
                  {if !$product.add_to_cart_url} 
                    bg-gray-500 
                  {else} 
                    bg-lbg-primary 
                  {/if} 
                {/if}  *}
                {if $is_cadeau == 1 || ($state_stock == 'in_stock' && $product.add_to_cart_url)}
                  bg-lbg-primary
                {else if  $state_stock == 'coming_soon'}
                  bg-lbg-primary
                {else if  $state_stock == 'out_of_stock_with_alert'}
                  bg-warning
                {else if  $state_stock == 'out_of_stock'}
                  bg-gray-500
                {/if}
                  rounded" 
                style="margin: 0;padding:2px;padding-left:3px;">
                {if !$is_logged_in && $is_cadeau == 1}
                  {block name='product_quantity'}
                    {* <span class="control-label">{l s='Quantity' d='Shop.Theme.Catalog'}</span> *}
                    <div class="product-quantity clearfix w-3/12 flex">
                        <div class="qty" style="margin-right: auto; margin-bottom: 0;">
                          <select 
                            type="number"
                            name="qty"
                            {* L'id pourrait être utile, voilà pourquoi il est commenté et pas supprimé *}
                            {* id="quantity_wanted" *}
                            inputmode="numeric"
                            pattern="[0-9]*"
                            {if $product.quantity_wanted}
                            value="{$product.quantity_wanted}"
                            min="{$product.minimal_quantity}"
                            {else}
                            value="1"
                            min="1"
                            {/if}
                            {* class="input-group" *}
                            aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
                            class="focus:outline-none w-14 text-lbg-primary p-1 rounded-sm w-16 bg-white"
                            style="height: 2.4rem; padding: 0.175rem 0.5rem; top: 1px; left: 1px; border-top-right-radius: 0; border-bottom-right-radius: 0; margin: 0;">
                              {foreach from=$array_for_select_qty_product_to_add item='item'}
                                {if $item != 0}
                                  <option value="{$item}" class="hover:bg-lbg-primary">{$item}</option>
                                {/if}
                              {/foreach}
                          </select>
                        </div>
                    </div>
                  {/block} 
                  <button id="add-to-cart-{$product.id_product}" type="button" data-button-action="add-to-cart"
                    {if !$product.add_to_cart_url}
                      disabled
                    {/if}
                    data-wx-action="addto_cart" data-modal-text="Vous devez être connecté avant de pouvoir ajouter ce produit au panier"
                    {* class="w-full sm:w-full wx-loggin-modal lbg-btn {if !$product.add_to_cart_url}bg-gray-500 text-white cursor-not-allowed{else}bg-lbg-primary{/if} text-base space-x-2 focus:outline-none"> *}
                    class="my-0 text-[.9rem] w-9/12 text-center text-white 
                    {if $is_cadeau == 1 || ($state_stock == 'in_stock' && $product.add_to_cart_url)}
                      bg-lbg-primary
                    {else if  $state_stock == 'coming_soon'}
                      bg-lbg-primary
                    {else if  $state_stock == 'out_of_stock_with_alert'}
                      bg-warning
                    {else if  $state_stock == 'out_of_stock'}
                      bg-gray-500 text-white cursor-not-allowed
                    {/if}
                    {* {if !$product.add_to_cart_url}bg-gray-500 text-white cursor-not-allowed{else}bg-lbg-primary{/if} *} text-base space-x-2 focus:outline-none">
                    <div class="text-white w-full text-center">
                      <span class="text-white">{l s='Add to cart' d='Shop.Theme.Actions'}</span> 
                    </div> 
                    {* <span>{l s='Add to cart' d='Shop.Theme.Actions'}</span> *}
                  </button>
                {else if  $state_stock != 'in_stock' && $state_stock != 'coming_soon'}
                  <button type="button"
                      {* class="waitinlist-modal-btn w-full sm:w-full lbg-btn error-btn-full text-base space-x-2 focus:outline-none"> *}
                      {if $state_stock == 'out_of_stock_with_alert'}@click="{ modalIsOpen = !modalIsOpen }"{/if}
                      class="waitinlist-modal-btn *
                      {if $is_cadeau == 1 || ($state_stock == 'in_stock' && $product.add_to_cart_url)}
                        bg-lbg-primary
                      {else if  $state_stock == 'coming_soon'}
                        bg-lbg-primary
                      {else if  $state_stock == 'out_of_stock_with_alert'}
                        bg-warning
                      {else if  $state_stock == 'out_of_stock'}
                        bg-gray-500 text-white cursor-not-allowed
                      {/if}
                      my-0 text-[.9rem] w-full py-2 text-white font-bold text-center text- error-btn-full text-base space-x-2 focus:outline-none">
                      <span class="text-white">
                      {if $state_stock == 'out_of_stock_with_alert'}
                        {l s='M\'avertir du retour de cet article' d='Shop.Theme.Actions'}
                      {elseif $state_stock == 'out_of_stock'}
                        {l s='Indisponible' d='Shop.Theme.Actions'}
                      {else}
                        {l s='Ajouter au panier' d='Shop.Theme.Actions'}
                      {/if}  
                      </span>                    
                      {* <span class="text-white">{l s='Indisponible' d='Shop.Theme.Actions'}</span>                       *}
                  </button>
                {else}
                  {block name='product_quantity'}
                    {* <span class="control-label">{l s='Quantity' d='Shop.Theme.Catalog'}</span> *}
                    <div class="product-quantity clearfix flex w-2/12">
                        <div class="qty" style="margin-right: auto; margin-bottom: 0;">
                          <select 
                            type="number"
                            name="qty"
                            {* L'id pourrait être utile, voilà pourquoi il est commenté et pas supprimé *}
                            {* id="quantity_wanted" *}
                            inputmode="numeric"
                            pattern="[0-9]*"
                            {if $product.quantity_wanted}
                            value="{$product.quantity_wanted}"
                            min="{$product.minimal_quantity}"
                            {else}
                            value="1"
                            min="1"
                            {/if}
                            {* class="input-group" *}
                            aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
                            class="focus:outline-none w-14 text-lbg-primary p-1 rounded-sm w-16 bg-white"
                            style="height: 2.4rem; padding: 0.175rem 0.5rem; top: 1px; left: 1px; border-top-right-radius: 0; border-bottom-right-radius: 0; margin: 0;">
                              {foreach from=$array_for_select_qty_product_to_add item='item'}
                                {if $item != 0}
                                  <option value="{$item}" class="hover:bg-lbg-primary">{$item}</option>
                                {/if}
                              {/foreach}
                          </select>
                        </div>
                    </div>
                  {/block} 
                  <button data-button-action="add-to-cart"
                    {if $is_logged_in}type="submit"{else}type="button"{/if}
                    {if !$product.add_to_cart_url}
                      disabled
                    {/if}
                    {if $state_stock == 'in_stock' || $state_stock == 'coming_soon'}
                      id="add-to-cart-{$product.id_product}"
                    {/if}
                    class="text-[.9rem] text-center text- 
                    {if $is_cadeau == 1 || ($state_stock == 'in_stock' && $product.add_to_cart_url)}
                      my-0 w-9/12 bg-lbg-primary
                    {else if  $state_stock == 'coming_soon'}
                      my-0 w-9/12 bg-lbg-primary
                    {else if  $state_stock == 'out_of_stock_with_alert'}
                      bg-warning
                    {else if  $state_stock == 'out_of_stock'}
                      bg-gray-500 text-white cursor-not-allowed w-full py-2 
                    {/if}
                    lg:ml-4 text-base space-x-2 focus:outline-none">   
                    <div class="text-white w-full text-center">
                      {* {$state_stock|dump} *}
                      {if $state_stock == 'out_of_stock_with_alert'}
                        {l s='M\'avertir du retour de cet article' d='Shop.Theme.Actions'}
                      {elseif $state_stock == 'out_of_stock'}
                        {l s='Indisponible' d='Shop.Theme.Actions'}
                      {elseif $state_stock == 'in_stock' || $state_stock == 'coming_soon'}
                        {l s='Add to cart' d='Shop.Theme.Actions'}
                      {/if}
                    </div>               
                  </button>
                {/if}
            </div>
          </div>
        </div>
      {/block}
      {block name='product_minimal_quantity'}
        <p class="product-minimal-quantity js-product-minimal-quantity">
          {if $product.minimal_quantity > 1}
            {l
            s='The minimum purchase order quantity for the product is %quantity%.'
            d='Shop.Theme.Checkout'
            sprintf=['%quantity%' => $product.minimal_quantity]
            }
          {/if}
        </p>
      {/block}
    {/if}
 </div>