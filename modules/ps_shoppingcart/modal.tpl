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
<div id="blockcart-modal" class="modal fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
    aria-hidden="true">
    {* <div class="modal-dialog " role="document"> *}
    <div class="w-full mx-auto max-w-7xl" role="document" style="">
        <div class="modal-content rounded-xl relative" style="overflow:hidden">
            {* <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="{l s='Close' d='Shop.Theme.Global'}">
          <span aria-hidden="true">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-6 h-6">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" class="text-lbg-primary" />
            </svg>
          </span>
        </button>
        <h4 class="modal-title h6 text-sm-center" id="myModalLabel"><i class="material-icons rtl-no-flip"></i>{l s='Product successfully added to your shopping cart' d='Shop.Theme.Checkout'}</h4>
      </div> *}
            <button type="button" class="close absolute" data-dismiss="modal"
                aria-label="{l s='Close' d='Shop.Theme.Global'}">
                <span aria-hidden="true">
                    {* <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2"
                        stroke="currentColor" class="w-10 h-8">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12"
                            class="text-lbg-primary" />
                    </svg> *}
                    <svg xmlns="http://www.w3.org/2000/svg" class="close-icon w-4 h-6" viewBox="0 0 23.928 32.219">
                        <g id="Groupe_2742" data-name="Groupe 2742" transform="translate(-1694.653 -667.789)">
                            <path id="Tracé_1464" data-name="Tracé 1464" d="M0,0,15.956,26.441"
                                transform="matrix(0.995, -0.105, 0.105, 0.995, 1697.301, 671.584)" fill="#00A193"
                                stroke="#00A193" stroke-linecap="round" stroke-width="2" />
                            <path id="Tracé_1465" data-name="Tracé 1465" d="M15.956,0,0,26.441"
                                transform="translate(1701.308 669.398) rotate(11)" fill="#00A193" stroke="#00A193"
                                stroke-linecap="round" stroke-width="2" />
                        </g>
                    </svg>
                </span>
            </button>
            <style>
                .px-4.lbg-shadow.rounded-md.mb-5.mt-2.pt-5.w-full {
                    padding-top: 0;
                }
            </style>
            <div class="modal-body mt-8">
                <div class="flex flex-col gap-x-5 justify-center md:flex-row">
                    <!-- Bloc visible sur les appareils de bureau -->
                    <div class="hidden md:block h-44 w-44">
                        <div class="w-44">
                            <div class="flex justify-end h-44 w-44">
                                {if $product.default_image}
                                    <img src="{$product.default_image.medium.url}"
                                        data-full-size-image-url="{$product.default_image.large.url}"
                                        title="{$product.default_image.legend}" alt="{$product.default_image.legend}"
                                        {* loading="lazy" class="product-image"> *} loading="lazy" class="">
                                {else}
                                    <img src="{$urls.no_picture_image.bySize.medium_default.url}" loading="lazy"
                                        {* class="product-image" /> *} class="" />
                                {/if}
                            </div>
                            <div class="col-md-6 hidden">
                                {*<h6 class="my-3 product-name">{$product.name}</h6>*}
                                {*<p class="product-price">{$product.price}</p>*}
                                {hook h='displayProductPriceBlock' product=$product type="unit_price"}
                                {foreach from=$product.attributes item="property_value" key="property"}
                                    <span
                                        class="{$property|lower}">{l s='%label%:' sprintf=['%label%' => $property] d='Shop.Theme.Global'}<strong>
                                            {$property_value}</strong></span><br>
                                {/foreach}
                                {*<span class="product-quantity">{l s='Quantity:' d='Shop.Theme.Checkout'}&nbsp;<strong>{$product.cart_quantity}</strong></span>*}
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 h-96 md:h-44 px-0">
                        <div class="banner bg-green-02B57E rounded-md p-2">
                            <p class="flex gap-2 md:ml-5 text-white">
                                <svg xmlns="http://www.w3.org/2000/svg" width="23.793" height="23"
                                    viewBox="0 0 23.793 23">
                                    <g id="Groupe_2755" data-name="Groupe 2755" transform="translate(-761 -780.5)">
                                        <g id="Ellipse_260" data-name="Ellipse 260" transform="translate(761 780.5)"
                                            fill="none" stroke="#fff" stroke-width="2">
                                            <ellipse cx="11.897" cy="11.5" rx="11.897" ry="11.5" stroke="none" />
                                            <ellipse cx="11.897" cy="11.5" rx="10.897" ry="10.5" fill="none" />
                                        </g>
                                        <path id="Tracé_1467" data-name="Tracé 1467"
                                            d="M-2881-6517.467l4.023,4.777,6.789-10.309"
                                            transform="translate(3648.365 7309.838)" fill="none" stroke="#fff"
                                            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" />
                                    </g>
                                </svg>
                                Produit ajouté avec succès à votre panier
                            </p>
                        </div>
                        <!-- Contenu aligné horizontalement -->
                        <div class="flex items-center justify-between">
                            <!-- Image du produit alignée à gauche -->
                            <div class="md:hidden mr-4 mt-8 w-full ">
                                {if $product.default_image}
                                    <img src="{$product.default_image.medium.url}"
                                        data-full-size-image-url="{$product.default_image.large.url}"
                                        title="{$product.default_image.legend}" alt="{$product.default_image.legend}"
                                        {* loading="lazy" class="product-image"> *} loading="lazy" class="">
                                {else}
                                    <img src="{$urls.no_picture_image.bySize.medium_default.url}" loading="lazy"
                                        {* class="product-image" /> *} class="" />
                                {/if}
                            </div>
                            <!-- Contenu du produit aligné à droite -->
                            <div class="w-full">
                                <!-- Nom du produit -->
                                <div class="flex items-center justify-between pr-4 mt-2 md:mb-0 md:mr-4">
                                    <h6 class="mr-3 product-name">{$product.name}</h6>
                                    <div class="hidden md:flex items-center justify-end">
                                        <span
                                            class="ml-10 product-quantity">{l s='Qte:' d='Shop.Theme.Checkout'}&nbsp;<strong>{$product.cart_quantity}</strong></span>
                                    </div>
                                </div>
                                <!-- Quantité pour les appareils mobiles -->
                                <div class="md:hidden mt-2">
                                    <span
                                        class="ml-0 product-quantity">{l s='Qte:' d='Shop.Theme.Checkout'}&nbsp;<strong>{$product.cart_quantity}</strong></span>
                                </div>
                            </div>

                        </div>
                        <div>
                            {assign var="only_cadeau" value=false}
                            {if count($cart.products) == 1}
                                {assign var="is_cadeau" value=$wx_customshop->get_acf_value('carte_cadeau', $cart.products[0].id_product)}
                                {if $is_cadeau == 1}
                                    {assign var="only_cadeau" value=true}
                                {/if}
                            {/if}

                            {assign var="freeshipping_data_carte_rules" value=$wx_customshop->getFreeShipping()}
                            {if $freeshipping_data_carte_rules|count > 0}
                                {assign var="freeshipping" value=($freeshipping_data_carte_rules[0].minimum_amount - floatval($cart.subtotals.products.amount))}
                                <p class="flex mt-7 product-quantity">
                                    {if $only_cadeau}
                                        {l s='Vous bénéficiez de la livraison offerte.' d='Shop.Theme.Checkout'}
                                    {else}
                                        {if $freeshipping <= 0}
                                            {l s='Vous bénéficiez de la livraison offerte.' d='Shop.Theme.Checkout'}
                                        {else}
                                            {l
                                                                  s='Vous êtes à [1][2][/2][/1] de la livraison gratuite'
                                                                  sprintf=[
                                                                      '[1]' => '<span class="px-1 text-lbg-danger">',
                                                                      '[/1]' => ' €</span>',
                                                                      '[2]' => {str_replace('.',',',number_format((float)$freeshipping, 2, '.', ''))},
                                            '[/2]' => ''
                                            ]
                                            d='Shop.Theme.Checkout'
                                            }
                                        {/if}
                                    {/if}
                                </p>
                            {/if}
                        </div>
                        <!-- Boutons pour continuer à magasiner ou voir le panier -->

                        <div
                            class="flex items-center justify-between mt-2 flex-col md:flex-row space-y-2 md:space-y-0 md:space-x-4">
                            <button type="button"
                                class="bg-transparent border-lbg-primary border font-medium text-sm p-2 w-full text-center whitespace-nowrap rounded text-lbg-primary hover:bg-lbg-primary hover:text-white"
                                data-dismiss="modal">{l s='Continuer mes achats' d='Shop.Theme.Actions'}</button>
                            {* <button type="button" href="{$cart_url}" 
                                class="bg-lbg-primary font-medium text-sm text-white p-2 w-full text-center whitespace-nowrap rounded"
                                data-dismiss="modal">{l s='Voir mon panier' d='Shop.Theme.Actions'}</button> *}
                            {* {$cart_url|dump} *}
                            <a href="{$link->getPageLink('cart', true)}"
                                class="bg-lbg-primary hover:bg-primary font-medium text-sm text-white p-2 w-full text-center whitespace-nowrap rounded">
                                {l s='Voir mon panier' d='Shop.Theme.Actions'}</a>

                        </div>
                    </div>
                </div>
            </div>

            {hook h='displayCartModalFooter' product=$product}
        </div>
    </div>
</div>