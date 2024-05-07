{*
* 2007-2021 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@buy-addons.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    Buy-addons    <contact@buy-addons.com>
* @copyright 2007-2021 Buy-addons
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{assign var="checkhihi" value="hien"}
{if $embe == 1}
	{if count($shows) > 0}
		<div class="template_slide container">
			{if $title == 1}
				<div class="section-head px-6 md:px-0 lbg-text-dark page-top fadeOut_{$id_sl|escape:'htmlall':'UTF-8'}_title">
                    <h2 class="text-center">{$names|escape:'htmlall':'UTF-8'}</h2>
                </div>
			{/if}
				<div class="w-9/12 md:w-full mx-auto">
					<div style="width: {$sizeslide->sliw|escape:'htmlall':'UTF-8'};height: {$sizeslide->slih|escape:'htmlall':'UTF-8'}" class="fadeOut_{$id_sl|escape:'htmlall':'UTF-8'} owl-carousel owl-theme saddd">
					{foreach from=$shows item=item}
					
						{assign var="productlazy" value=$get_productlazyarray->getProductLazyArray($item.id_product)  scope="global"}
						{if !isset($product)}
							{assign var="product" value=$productlazy  scope="global"}
						{/if}

						{* Check if product can be show here *}
						{assign var="is_cadeau" value=$wx_customshop->get_acf_value('carte_cadeau', $item.id_product)}
						{assign var="reapro" value=$wx_customshop->get_acf_value('REAPRO', $item.id_product)}
						{assign var="stock_fournisseur" value=$wx_customshop->get_acf_value('stock_fournisseur', $item.id_product)}
						{assign var="show_product" value=false}
						{if (Product::getQuantity($productlazy.id_product) > 0 || ($reapro == 1 && $stock_fournisseur > 0))}
							{assign var="show_product" value=true}
						{/if}
											
						{if Product::getQuantity($item.id_product) <= 0 && $cstock == 1}
							{$checkhihi = 'an'}
						{else}
							{$checkhihi = 'hien'}
						{/if}
						{if $checkhihi == 'hien' && $show_product}
							{$ks = Category::getCategoryInformations(array($item.id_category_default))}
							{$im = Product::getCover($item.id_product)}
							{foreach from=$ks item=item1}
								{foreach from=$im item=item2}
									{$cur = Currency::getCurrency($id_currency)}
									{$lb3 = round({$item.price|escape:'htmlall':'UTF-8'}*$item.rate/100+$item.price,2)*$cur['conversion_rate']}
									{$lb4 = round(Product::getPriceStatic($item.id_product),2)|escape:'htmlall':'UTF-8'}
									{block name='product_miniature_item'}
										<div class="js-product product h-full border-b-2 {if count($productlazy.images) > 1}has-second-image{/if}">
											<div class="product-miniature js-product-miniature h-full relative">
												<div class="thumbnail-container relative slide17" data-id-wishlist="{$idWishlist}" data-id-product="{$productlazy.id_product}" data-id-product-attribute="{$productlazy.id_product_attribute}">
													<style>
														.slide17 .wishlist-button-add {
															display: none;
														}
													</style>
													<a class="block w-full h-72 relative" href="{BaProductsCarousel::getUrlFix($item.id_product|escape:'htmlall':'UTF-8')|escape:'htmlall':'UTF-8'}">
														<img class="absolute w-full h-full object-contain" src="{$productlazy.cover.bySize.home_default.url}" alt="">
														{if count($productlazy.images) > 1}
														<img src="{$productlazy.images[1].bySize.medium_default.url}"
															alt="{if !empty($productlazy.cover.legend)}{$product.cover.legend}{else}{$productlazy.name|truncate:30:'...'}{/if}"
															class="w-full h-full object-contain hidden"
														/>
														{/if}
														<div class="absolute top-0 w-full h-full flex flex-col justify-end transition-colors duration-500">
															{if $productlazy.has_discount}
																<div class="w-full border-b-4 lbg-border-error flex justify-end">
																<span class="inline-block bg-red-200 lbg-text-error py-0.5 px-1 text-xs">
																	{if $productlazy.discount_type === 'percentage'}
																	<span class="discount discount-percentage">{l s='soldes -%percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $productlazy.discount_percentage_absolute]}</span>
																	{else}
																	<span class="discount discount-amount">
																		{l s='soldes -%amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $productlazy.discount_to_display]}
																	</span>
																	{/if}
																</span>
																</div>
															{else}
															{foreach from=$productlazy.flags item=flag}
																{if $flag.type === "new"}
																<div class="w-full border-b-4 lbg-border-info flex justify-end">
																	<span class="inline-block bg-green-200 lbg-text-info py-0.5 px-1 text-xs">{$flag.label}</span>
																</div>
																{/if}
															{/foreach}
															{/if}
														</div>
													</a>
													<div class="lbg-text-dark">
														<p class="my-3 text-base font-medium"><a class="hover:lbg-text-primary whitespace-nowrap" href="{BaProductsCarousel::getUrlFix($item.id_product|escape:'htmlall':'UTF-8')}">{$item.name|truncate:30:"...":true}</a></p>
														<div class="flex">
															<div class="w-9/12">
																<p class="my-0 text-normal {if !Manufacturer::getNameById((int) $productlazy.id_manufacturer) and $is_cadeau != 1}py-2.5{/if}">
																	{if Manufacturer::getNameById((int) $productlazy.id_manufacturer)}
																		<a href="{$link->getmanufacturerLink($productlazy.id_manufacturer)}" class="font-medium">
																		{Manufacturer::getNameById((int) $productlazy.id_manufacturer)}
																		</a>
																	{else}
																		<p class="h-4"></p>
																	{/if}
																</p>
																<div class="flex space-x-2 items-end my-3">
																	{if $is_cadeau == 1 || $productlazy.main_variants}<span>Dès</span>{/if}
																	<p class="my-0 {if $productlazy.has_discount}lbg-text-error{/if} font-bold">
																		<span class="reg-price text-sm">
																			<span class='current-price-value' content="{*$productlazy.rounded_display_price*}">
																				{capture name='custom_price'}{hook h='displayProductPriceBlock' product=$productlazy type='custom_price' hook_origin='product_sheet'}{/capture}
																				{if '' !== $smarty.capture.custom_price}
																				{$smarty.capture.custom_price nofilter}
																				{else}
																				{assign var=exploded_price value=","|explode:$productlazy.price}
																				<span class="text-xl">{$exploded_price[0]}</span>,<span class="text-sm">{$exploded_price[1]}</span>
																				{/if}
																			</span>
																		</span>
																	</p>
																	{if $productlazy.has_discount}
																		<p class="product-discount font-bold">
																		{hook h='displayProductPriceBlock' product=$productlazy type="old_price"}
																		<span class="regular-price text-xs text-black">{$productlazy.regular_price}</span>
																		</p>
																	{/if}
																</div>
															</div>
															<div class="w-3/12 flex justify-end pr-1">
																{if $productlazy.main_variants}
																	{block name='quick_view'}
																	<a {*removed classes:quick-view js-quick-view*} class="h-12 w-12 rounded-full lbg-bg-secondary flex items-center justify-center text-white" href="{BaProductsCarousel::getUrlFix($item.id_product|escape:'htmlall':'UTF-8')|escape:'htmlall':'UTF-8'}" {*data-link-action="quickview"*}>
																	<svg id="Icon_search" data-name="Icon search" xmlns="http://www.w3.org/2000/svg" width="20" height="20.955" viewBox="0 0 20 20.955">
																		<rect id="Rectangle_693" data-name="Rectangle 693" width="20" height="20" transform="translate(0)" fill="none"/>
																		<g id="Groupe_2041" data-name="Groupe 2041" transform="translate(-7.737 -4.545)">
																			<path id="Tracé_1169" data-name="Tracé 1169" d="M26.507,25.5a4.073,4.073,0,0,1-2.427-1.322,22.283,22.283,0,0,1-2.326-2.621c-.085-.111-.19-.23-.3-.357a11.271,11.271,0,0,1-.692-1.971l-.866.523a4,4,0,0,1-.768.359,8.663,8.663,0,0,1-2.773.439,8.626,8.626,0,0,1-6.282-2.476,8.593,8.593,0,0,1-2.319-5.229A7.41,7.41,0,0,1,9.51,7.507a7.632,7.632,0,0,1,5.024-2.938c.19-.016.384-.024.577-.024a8.629,8.629,0,0,1,5.318,1.988,7.95,7.95,0,0,1,3.052,5.119c.291,2.068-.435,3.8-1.614,5.767l-.283.473.449.319A29.345,29.345,0,0,1,25.954,21.4c1.159,1.177,2.252,2.512,1.574,3.5a1.191,1.191,0,0,1-1.021.6ZM15.242,6.4a5.631,5.631,0,0,0-4.417,1.955l-.026.031-.022.035c-.2.313-.363.562-.525.782l-.024.033-.019.035a6.477,6.477,0,0,0,1.411,7.919,7.492,7.492,0,0,0,4.651,1.9,4.88,4.88,0,0,0,1.216-.151,6.334,6.334,0,0,0,2.655-1.539c.113-.1.214-.206.3-.3a2.876,2.876,0,0,1,.3-.281l.257-.42c1.043-.969,1.336-2.612.825-4.65a6.908,6.908,0,0,0-2.777-4.214A6.959,6.959,0,0,0,15.242,6.4Z" transform="translate(0)" fill="currentColor"/>
																		</g>
																	</svg>
																	{l s='' d='Shop.Theme.Actions'}
																	</a> 
																	{/block}
																{elseif $addtocart->addcart == 1}
																<div class="add_to_carsou button-container" >
																	<form action="{$urls.pages.cart|escape:'htmlall':'UTF-8'}" method="post" accept-charset="utf-8">
																	<input type="hidden" name="id_product" value="{$productlazy.id_product|escape:'htmlall':'UTF-8'}"/>
																	<input type="hidden" name="token" value="{$baproductscarousel_token|escape:'htmlall':'UTF-8'}"/>
																	{if (Product::getQuantity($productlazy.id_product) <= 0 && $reapro != 1) || $is_cadeau == 1 || (Product::getQuantity($productlazy.id_product) <= 0 && ($reapro != 1 && $stock_fournisseur <= 0))}
																	{block name='quick_view'}
																	<a {*removed classes:quick-view js-quick-view*} class="h-12 w-12 rounded-full lbg-bg-secondary flex items-center justify-center text-white" href="{BaProductsCarousel::getUrlFix($item.id_product|escape:'htmlall':'UTF-8')|escape:'htmlall':'UTF-8'}" {*data-link-action="quickview"*}>
																	<svg id="Icon_search" data-name="Icon search" xmlns="http://www.w3.org/2000/svg" width="20" height="20.955" viewBox="0 0 20 20.955">
																		<rect id="Rectangle_693" data-name="Rectangle 693" width="20" height="20" transform="translate(0)" fill="none"/>
																		<g id="Groupe_2041" data-name="Groupe 2041" transform="translate(-7.737 -4.545)">
																			<path id="Tracé_1169" data-name="Tracé 1169" d="M26.507,25.5a4.073,4.073,0,0,1-2.427-1.322,22.283,22.283,0,0,1-2.326-2.621c-.085-.111-.19-.23-.3-.357a11.271,11.271,0,0,1-.692-1.971l-.866.523a4,4,0,0,1-.768.359,8.663,8.663,0,0,1-2.773.439,8.626,8.626,0,0,1-6.282-2.476,8.593,8.593,0,0,1-2.319-5.229A7.41,7.41,0,0,1,9.51,7.507a7.632,7.632,0,0,1,5.024-2.938c.19-.016.384-.024.577-.024a8.629,8.629,0,0,1,5.318,1.988,7.95,7.95,0,0,1,3.052,5.119c.291,2.068-.435,3.8-1.614,5.767l-.283.473.449.319A29.345,29.345,0,0,1,25.954,21.4c1.159,1.177,2.252,2.512,1.574,3.5a1.191,1.191,0,0,1-1.021.6ZM15.242,6.4a5.631,5.631,0,0,0-4.417,1.955l-.026.031-.022.035c-.2.313-.363.562-.525.782l-.024.033-.019.035a6.477,6.477,0,0,0,1.411,7.919,7.492,7.492,0,0,0,4.651,1.9,4.88,4.88,0,0,0,1.216-.151,6.334,6.334,0,0,0,2.655-1.539c.113-.1.214-.206.3-.3a2.876,2.876,0,0,1,.3-.281l.257-.42c1.043-.969,1.336-2.612.825-4.65a6.908,6.908,0,0,0-2.777-4.214A6.959,6.959,0,0,0,15.242,6.4Z" transform="translate(0)" fill="currentColor"/>
																		</g>
																	</svg>
																	{l s='' d='Shop.Theme.Actions'}
																	</a> 
																	{/block}
																	{else}
																		{* <button type="submit" class="h-12 w-12 rounded-full lbg-bg-primary flex items-center justify-center text-white ajax_add_to_cart_button add-to-cart" style="background: #00A193!important;" {if Product::getQuantity($productlazy.id_product) > 0} data-button-action="add-to-cart"  rel="nofollow" title="{l s='Ajouter au panier' mod='baproductscarousel'}"  data-id-product="{$productlazy.id_product|escape:'htmlall':'UTF-8'}"{/if}>
																			<svg id="cart-with-items" class="ml-2" xmlns="http://www.w3.org/2000/svg" width="39.122" height="27.926" viewBox="0 0 39.122 27.926">
																			<path id="Tracé_1180" data-name="Tracé 1180" d="M30.047,68.361c-6.317.674-12,1.437-18.356.643a1.111,1.111,0,0,0-.116-.054,1.048,1.048,0,0,1-.771-1.116c.54-.772,1.695-.722,2.5-.66,1.132.087,2.255.076,3.39.065a75.33,75.33,0,0,0,8.824-.608c1.619-.209,3.231-.442,4.838-.733a.728.728,0,0,0,.625-.865.963.963,0,0,0,.02-.159c.089-3.434-.08-6.487.254-9.908.052-.535-1.953-.824-2.365-.851a.871.871,0,0,0-.327-.042c-7.414.43-12.928.161-20.353.248a1.013,1.013,0,0,0-.149-.142,8.92,8.92,0,0,0-3.687-1.605c-1.092-.317-2.209.786-1.123,1.1,4.084,1.186,5.919,4.716,6.7,8.657a30.377,30.377,0,0,1,.444,3.584c.006.075-1.025.879-1.138,1.085a2.065,2.065,0,0,0-.175,1.487c.36,1.51,1.593,2.134,3.014,2.383a3.945,3.945,0,0,0-.595,1.151.83.83,0,0,0-.03.433,2.955,2.955,0,0,0,.827,2.181,3.536,3.536,0,0,0,2.336.844.91.91,0,0,0,.261-.026c.03,0,.059,0,.09-.005a3.224,3.224,0,0,0,2.792-2.936A2.384,2.384,0,0,0,17.41,71c2.405-.039,4.77-.242,7.166-.479a3.162,3.162,0,0,0-.522.987c-.606,1.963,1.3,3.346,3.128,3.444a.911.911,0,0,0,.261-.026c.03,0,.059,0,.09-.005a3.224,3.224,0,0,0,2.792-2.936,2.479,2.479,0,0,0-.765-2c.395-.044.789-.09,1.184-.132C31.857,69.738,31.174,68.241,30.047,68.361ZM29.692,55.8c-.067.776-.417,8.048-.429,8.5q-2.119.367-4.248.62c-.007-.661-.224-8.229-.293-8.94C26.445,55.924,27.97,55.9,29.692,55.8Zm-6.921,0c.067.7.481,8.6.488,9.313-1.648.16-3,.029-4.66.088-.1-.743-1.419-8.557-1.48-9.254Q19.945,55.894,22.771,55.8ZM9.42,56.067c1.981-.024,4.393-.229,6.373-.263.061.7.659,8.975.757,9.689q-2.214.031-4.432-.06A96.638,96.638,0,0,0,9.42,56.067Zm5.24,17.661-.021,0c-.97-.052-1.413-.381-1.405-1.31a1.687,1.687,0,0,1,1.585-1.145c.664.149,1.218.481,1.205,1.247C16.011,73.247,15.279,73.6,14.66,73.728ZM27.2,73.2l-.021,0c-.97-.052-1.413-.381-1.405-1.31a1.687,1.687,0,0,1,1.585-1.145c.664.149,1.218.481,1.205,1.247C28.553,72.719,27.821,73.071,27.2,73.2Z" transform="translate(-2.811 -47.559)" fill="#fff"/>
																			</svg>
																		</button> *}
																		<button 
																			type="submit" 
																			data-button-action="add-to-cart" 
																			class="h-12 w-12 rounded-full lbg-bg-primary flex items-center justify-center text-white ajax_add_to_cart_button add-to-cart" style="background: #00A193!important;" rel="nofollow" title="{l s='Ajouter au panier' mod='baproductscarousel'}"  data-id-product="{$product.id_product|escape:'htmlall':'UTF-8'}">
																			<svg id="cart-with-items" class="ml-2" xmlns="http://www.w3.org/2000/svg" width="39.122" height="27.926" viewBox="0 0 39.122 27.926">
																			<path id="Tracé_1180" data-name="Tracé 1180" d="M30.047,68.361c-6.317.674-12,1.437-18.356.643a1.111,1.111,0,0,0-.116-.054,1.048,1.048,0,0,1-.771-1.116c.54-.772,1.695-.722,2.5-.66,1.132.087,2.255.076,3.39.065a75.33,75.33,0,0,0,8.824-.608c1.619-.209,3.231-.442,4.838-.733a.728.728,0,0,0,.625-.865.963.963,0,0,0,.02-.159c.089-3.434-.08-6.487.254-9.908.052-.535-1.953-.824-2.365-.851a.871.871,0,0,0-.327-.042c-7.414.43-12.928.161-20.353.248a1.013,1.013,0,0,0-.149-.142,8.92,8.92,0,0,0-3.687-1.605c-1.092-.317-2.209.786-1.123,1.1,4.084,1.186,5.919,4.716,6.7,8.657a30.377,30.377,0,0,1,.444,3.584c.006.075-1.025.879-1.138,1.085a2.065,2.065,0,0,0-.175,1.487c.36,1.51,1.593,2.134,3.014,2.383a3.945,3.945,0,0,0-.595,1.151.83.83,0,0,0-.03.433,2.955,2.955,0,0,0,.827,2.181,3.536,3.536,0,0,0,2.336.844.91.91,0,0,0,.261-.026c.03,0,.059,0,.09-.005a3.224,3.224,0,0,0,2.792-2.936A2.384,2.384,0,0,0,17.41,71c2.405-.039,4.77-.242,7.166-.479a3.162,3.162,0,0,0-.522.987c-.606,1.963,1.3,3.346,3.128,3.444a.911.911,0,0,0,.261-.026c.03,0,.059,0,.09-.005a3.224,3.224,0,0,0,2.792-2.936,2.479,2.479,0,0,0-.765-2c.395-.044.789-.09,1.184-.132C31.857,69.738,31.174,68.241,30.047,68.361ZM29.692,55.8c-.067.776-.417,8.048-.429,8.5q-2.119.367-4.248.62c-.007-.661-.224-8.229-.293-8.94C26.445,55.924,27.97,55.9,29.692,55.8Zm-6.921,0c.067.7.481,8.6.488,9.313-1.648.16-3,.029-4.66.088-.1-.743-1.419-8.557-1.48-9.254Q19.945,55.894,22.771,55.8ZM9.42,56.067c1.981-.024,4.393-.229,6.373-.263.061.7.659,8.975.757,9.689q-2.214.031-4.432-.06A96.638,96.638,0,0,0,9.42,56.067Zm5.24,17.661-.021,0c-.97-.052-1.413-.381-1.405-1.31a1.687,1.687,0,0,1,1.585-1.145c.664.149,1.218.481,1.205,1.247C16.011,73.247,15.279,73.6,14.66,73.728ZM27.2,73.2l-.021,0c-.97-.052-1.413-.381-1.405-1.31a1.687,1.687,0,0,1,1.585-1.145c.664.149,1.218.481,1.205,1.247C28.553,72.719,27.821,73.071,27.2,73.2Z" transform="translate(-2.811 -47.559)" fill="#fff"/>
																			</svg>
																		</button>
																	{/if}
																	</form>
																</div> 
																{/if} 
															</div>
														</div>
														{if $productlazy.main_variants}
															{include file='catalog/_partials/variant-links.tpl' variants=$productlazy.main_variants}
														{/if}
													</div>
													{block name="wx_wishlist"}
													{assign var="is_in_wishlist" value=$wx_customshop->isInWishlist($productlazy.id_product)}
													<div class="absolute top-2 right-2 wx_wishlist_btns">
														{if !$is_in_wishlist}
														<button {if !$is_logged_in}data-wx-action="addto_wishlist"{/if} class="{if $is_logged_in}wx_addto_wishlist{else}wx-loggin-modal{/if} bg-white h-10 w-10 z-50 rounded-full shadow-md hover:shadow-lg p-2">
															<i class="material-icons" data-id-product="{$productlazy.id_product}">favorite_border</i>
														</button>
														{else}
														<button class="wx_removefrom_wishlist bg-white h-10 w-10 z-50 rounded-full shadow-md hover:shadow-lg p-2">
															<i class="material-icons" data-id-product="{$productlazy.id_product}">favorite</i>
														</button>
														{/if}
													</div>
													{/block}
												</div>
											</div>
										</div>
									{/block}
								{/foreach}
							{/foreach}
						{/if}
					{/foreach}
				</div>
			</div>
		</div>
	{/if}
{/if}