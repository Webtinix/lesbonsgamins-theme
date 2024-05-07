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
{extends file=$layout}

{block name='head' append}
    <meta property="og:type" content="product">
    {if $product.cover}
        <meta property="og:image" content="{$product.cover.large.url}">
    {/if}

    {if $product.show_price}
        <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
        <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
        <meta property="product:price:amount" content="{$product.price_amount}">
        <meta property="product:price:currency" content="{$currency.iso_code}">
    {/if}
    {if isset($product.weight) && ($product.weight != 0)}
        <meta property="product:weight:value" content="{$product.weight}">
        <meta property="product:weight:units" content="{$product.weight_unit}">
    {/if}
{/block}

{block name='head_microdata_special'}
    {include file='_partials/microdata/product-jsonld.tpl'}
{/block}

{block name='content'}

    <div class="product-container js-product-container">
        <section class="grid lg:grid-cols-2 gap-5 md:gap-10 lg:h-[38rem] mx-auto px-4 mt-5 md:mt-9"
            style="max-width: 85rem;">
            <div x-data="{ wx_active_img: 'wx_product_images_thumb_{$product.default_image.id_image}' }"
                class="relative overflow-hidden md:overflow-visible">
                {block name='page_content'}
                    {include file='catalog/_partials/product-flags.tpl'}

                    {block name='product_cover_thumbnails'}
                        {include file='catalog/_partials/product-cover-thumbnails.tpl'}
                    {/block}
                {/block}
            </div>
            <div class="flex flex-col">
                {if $product.id_manufacturer && Manufacturer::getNameById((int) $product.id_manufacturer)}
                    <h2>
                        <a href="{$link->getmanufacturerLink($product.id_manufacturer)}"
                            class="text-base font-medium manufacturer">
                            {Manufacturer::getNameById((int) $product.id_manufacturer)}
                        </a>
                    </h2>
                {/if}
                {assign var='h1_text' value=$wx_customshop->get_acf_value('h_1', $product.id_product, 'product')}
                {assign var="tarif_degressif" value=$wx_customshop->get_acf_value('tarif_degressif', $product.id_product)}
                <h1 class="font-bold text-2xl">{if $h1_text != ""}{$h1_text}{else}{$product.name}{/if}</h1>
                {* <div class="text-[.9rem] md:hidden">
                    {if $product.description_short}
                    <div id="mobile-product-description-short-{$product.id}" class="product-description-short md:hidden">
                        {$product.description_short nofilter}
                    </div>
                    {else}
                    <div id="mobile-product-description-short-{$product.id}" class="md:hidden product-description-short">
                        {strip_tags($product.description)|truncate:150:"..."}
                    </div>
                    {/if}
                </div> *}
                {assign var="product_rate" value=$wx_customshop->get_SAG_product_rate($product.id_product)}
                <div class="flex flex-col gap-4 mt-4 ">
                    <div
                        class="flex lg:items-center md:items-center flex-col-reverse lg:flex-row justify-between flex-wrap {if $product_rate['rate'] > 0}gap-5{/if}">
                        {* <p class="lg:w-fit flex items-center md:justify-between gap-5 font-medium text-[1.3rem] ">
                            {assign var="is_cadeau" value=$wx_customshop->get_acf_value('carte_cadeau', $product.id_product)}
                            {if $is_cadeau == 1}
                                <span>A partir de</span>
                            {/if}
                            <span
                                class='current-price-value regular-product-price text-2xl flex flex-col justify-center items-center font-bold md:font-normal {if $product.has_discount}md:text-red-600{/if}'
                                content="{$product.rounded_display_price}">
                                {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='product_sheet'}{/capture}
                                {if '' !== $smarty.capture.custom_price}
                                    <span class="block w-full {if $product.has_discount}md:text-red-600{/if}">{$smarty.capture.custom_price nofilter}</span>
                                {else}
                                    <span class="block w-full {if $product.has_discount}md:text-red-600{/if}">{$product.price}</span>
                                {/if}
                                {if $product.ecotax['value'] > 0}
                                    <span class="wx-ecopart-btn w-full text-xs cursor-pointer">{$product.ecotax['value']} {l s='d\'éco-part' d='Shop.Theme.Catalog'}</span>
                                {/if}
                            </span>
                            {if $product.has_discount}
                                <span class="product-discount text-xl flex justify-center items-center">
                                    {hook h='displayProductPriceBlock' product=$product type="old_price"}
                                    <span class="regular-price text-red-600 md:text-gray-400">{$product.regular_price}</span>
                                </span>
                            {/if}
                            {if $product.has_discount}
                                <span class="rounded bg-fff3e8 text-xl flex justify-center items-center px-3 p-1">
                                    <span class="regular-price text-red-600">{$product.discount_percentage}</span>
                                </span>
                            {/if}
                        </p> *}
                        {block name='product_prices'}
                            {include file='catalog/_partials/product-prices.tpl'}
                        {/block}
                        {block name='wx-ecopart-modal'}
                            {include file='catalog/_partials/eco-part-modal.tpl' product=$product}
                        {/block}
                        {if $product_rate['rate'] > 0}
                            <div class="mt-4 md:mt-0">
                                <div class="space-x-1">
                                    <div class="Stars" style="--rating: {$product_rate['rate']};"
                                        aria-label="La note de ce produit est de {$product_rate['rate']} sur 5.">
                                    </div>
                                    <a href="#agWidgetMain" class="pl-2 underline">Voir les {$product_rate['count']} avis</a>
                                </div>
                            </div>
                        {/if}
                    </div>
                    {if $tarif_degressif == 1 && $product.quantity_discounts}
                        <div x-data="{ open: false }">
                            {block name='page_header_container'}
                                {block name='page_header'}
                                    {if $tarif_degressif == 1 && $product.quantity_discounts}
                                        <button id="degressif_mobile_show" @click="open = ! open"
                                            class="border-2 border-lbg-primary rounded text-lbg-primary py-0.5 w-36 text-[.9rem]">{l s='Prix dégressifs' d='Shop.Theme.Catalog'}
                                        </button>
                                    {/if}
                                {/block}
                            {/block}

                            {include file='catalog/_partials/product-discounts.tpl'}
                        </div>
                    {/if}
                    <div class="text-[.9rem] hidden lg:block">
                        {block name='product_description_short'}
                            <div class="hidden sm:block">
                                {if $product.description_short}
                                    <div id="product-description-short-{$product.id}"
                                        class="product-description-short hidden sm:block">
                                        {strip_tags($product.description_short)|truncate:150:"..."}
                                        <a href="#product-description"
                                            class="underline ml-2 decoration-blue-500 text-blue-500 hidden lg:inline-block ">{l s='En savoir plus' d='Shop.Theme.Catalog'}</a>
                                    </div>
                                {else}
                                    <div id="product-description-short-{$product.id}"
                                        class="product-description-short hidden sm:block">
                                        {strip_tags($product.description)|truncate:150:"..."}
                                        <a href="#product-description"
                                            class="underline ml-2 decoration-blue-500 text-blue-500 hidden lg:inline-block ">{l s='En savoir plus' d='Shop.Theme.Catalog'}</a>
                                    </div>
                                {/if}
                            </div>
                        {/block}
                    </div>
                </div>
                <div class="product-information">
                    <div class="product-actions js-product-actions">
                        {block name='product_buy'}
                            <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                                <input type="hidden" name="token" value="{$static_token}">
                                <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                                <input type="hidden" name="id_customization" value="{$product.id_customization}"
                                    id="product_customization_id" class="js-product-customization-id">

                                <div x-data="{ modalIsOpen: false }">
                                    {block name='waitinglist_modal'}
                                        {include file='catalog/_partials/waintinglist-modal.tpl'}
                                    {/block}
                                    {block name='product_variants'}
                                        {include file='catalog/_partials/product-variants.tpl'}
                                    {/block}
                                    {block name='product_add_to_cart'}
                                        {include file='catalog/_partials/product-add-to-cart.tpl'}
                                    {/block}
                                    {block name="paymentshortcut"}
                                        <div class="mt-2 md:mt-4">{widget name='paypal' action='paymentshortcut'}</div>
                                    {/block}
                                    {block name="paypal_banner"}
                                        <div class="mt-2 md:mt-4">{widget name='paypal' action='banner4x'}</div>
                                    {/block}
                                </div>

                                {block name='product_pack'}
                                    {if $packItems}
                                        <section class="product-pack">
                                            <p class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'} {count($packItems)} articles
                                            </p>
                                            <div
                                                class="lbg-bg-gray-100 rounded p-2 {if count($packItems) >= 2 }h-72 overflow-y-scroll lbg-scrollbar{/if}">
                                                {foreach from=$packItems item="product_pack"}
                                                    {block name='product_miniature'}
                                                        {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                                                    {/block}
                                                    {block name='product_miniature'}
                                                        {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack showPackProductsPrice=$product.show_price}
                                                    {/block}
                                                {/foreach}
                                            </div>
                                        </section>
                                    {/if}
                                {/block}

                                {block name='hook_display_reassurance'}
                                    {* <div class="md:pl-3 grid md:grid-cols-2 gap-10 gap-y-3 mt-5"> *}
                                    {hook h='displayReassurance'}
                                    {* </div> *}
                                {/block}

                                {block name='product_refresh'}{/block}
                            </form>
                        {/block}
                    </div>
                </div>
            </div>
        </section>

        <section x-data="{ open_detail: true, open_livraison_et_retour: false }" class="px-4 my-10 mx-auto"
            style="max-width: 85rem;">
            <div class="hidden md:flex lg:flex w-full">
                <p class="md:w-1/2 border-b-8 relative md:grid grid-cols-2 text-lbg-primary text-2xl py-3 md:py-5 font-medium"
                    :class="open_detail ? 
                'border-primary' 
                :'border-primary/25'">
                    <span @click="open_detail = true; open_livraison_et_retour = false" class="cursor-pointer" :class="!open_detail ? 
                    'opacity-60' 
                    :''">Détail article</span>
                    <button @click="open_detail = !open_detail"
                        class="md:hidden absolute right-3 -bottom-2 w-8 fill-lbg-primary">
                        {* <svg class="transform transition-transfom duration-300 md:hidden absolute right-3 -bottom-2 w-8 fill-lbg-primary" :class="open_detail ? 'rotate-180' : ''" xmlns="http://www.w3.org/2000/svg" height="10" viewBox="0 0 8.024 5.982">
                            <path id="Tracé_1348" data-name="Tracé 1348" d="M9341.332,1216l3.316,4.786,3.315-4.786" transform="translate(-9340.636 -1215.304)" fill="none" stroke="#191310" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/>
                        </svg>       *}
                        <svg xmlns="http://www.w3.org/2000/svg"
                            class="transform transition-transfom duration-300 md:hidden right-3 -bottom-2 w-8 fill-lbg-primary"
                            :class="!open_detail ? 'rotate-180' : ''" viewBox="0 -960 960 960">
                            <path d="m296-345-56-56 240-240 240 240-56 56-184-184-184 184Z" />
                        </svg>
                    </button>
                </p>
                <p class="md:w-1/2 border-b-8 relative md:grid grid-cols-2 text-lbg-primary text-2xl py-3 md:py-5 font-medium"
                    :class="open_livraison_et_retour ? 
                'border-primary' 
                :'border-primary/25'">
                    <span @click="open_livraison_et_retour = true; open_detail = false"
                        class="cursor-pointer md:inline-block hidden" x-bind:class="open_detail ? 
                    'opacity-60 hidden' 
                    :''">Livraison et retour</span>
                    <button @click="open_detail = !open_detail"
                        class="md:hidden absolute right-3 -bottom-2 w-8 fill-lbg-primary">
                        {* <svg class="transform transition-transfom duration-300 md:hidden absolute right-3 -bottom-2 w-8 fill-lbg-primary" :class="open_detail ? 'rotate-180' : ''" xmlns="http://www.w3.org/2000/svg" height="10" viewBox="0 0 8.024 5.982">
                            <path id="Tracé_1348" data-name="Tracé 1348" d="M9341.332,1216l3.316,4.786,3.315-4.786" transform="translate(-9340.636 -1215.304)" fill="none" stroke="#191310" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/>
                        </svg>       *}
                        <svg xmlns="http://www.w3.org/2000/svg"
                            class="transform transition-transfom duration-300 md:hidden right-3 -bottom-2 w-8 fill-lbg-primary"
                            :class="!open_livraison_et_retour ? 'rotate-180' : ''" viewBox="0 -960 960 960">
                            <path d="m296-345-56-56 240-240 240 240-56 56-184-184-184 184Z" />
                        </svg>
                    </button>
                </p>
            </div>
            <div class="w-full">
                <p class="flex justify-between w-full md:hidden lg:hidden border-b-8 relative md:grid grid-cols-2 text-lbg-primary text-2xl py-3 md:py-5 font-medium"
                    :class="open_detail ? 
                'border-primary' 
                :'border-primary/25'">
                    <span @click="open_detail = true;" class="cursor-pointer" :class="!open_detail ? 
                    'opacity-60' 
                    :''">Détail article</span>
                    <button @click="open_detail = !open_detail" class="md:hidden right-3 -bottom-2 w-8 fill-lbg-primary">
                        {* <svg class="transform transition-transfom duration-300 md:hidden right-3 -bottom-2 w-8 fill-lbg-primary" :class="open_detail ? 'rotate-180' : ''" xmlns="http://www.w3.org/2000/svg" height="10" viewBox="0 0 8.024 5.982">
                            <path id="Tracé_1348" data-name="Tracé 1348" d="M9341.332,1216l3.316,4.786,3.315-4.786" transform="translate(-9340.636 -1215.304)" fill="none" stroke="#191310" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/>
                        </svg>  *}
                        <svg xmlns="http://www.w3.org/2000/svg"
                            class="transform transition-transfom duration-300 md:hidden right-3 -bottom-2 w-8 fill-lbg-primary"
                            :class="!open_detail ? 'rotate-180' : ''" viewBox="0 -960 960 960">
                            <path d="m296-345-56-56 240-240 240 240-56 56-184-184-184 184Z" />
                        </svg>
                    </button>
                </p>
                <div x-cloak x-show="open_detail" class="grid md:grid-cols-6 gap-10 md:gap-20 py-10 px-5 ">
                    <div class="flex flex-col gap-10 md:gap-5 col-span-4">
                        {if $product.description}
                            {block name='product_description'}
                                <h2 class="text-xl font-medium">
                                    {l s='Description : %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Catalog'}
                                </h2>
                                <div class="md:px-0" id="product-description">
                                    {* <div class="product-description {if $product.description|count_characters:true > 360}column-count-2{else}md:w-1/2{/if}"> *}
                                    <div class="product-description">
                                        {$product.description nofilter}
                                    </div>
                                </div>
                            {/block}
                        {/if}
                    </div>
                    <div class="flex flex-col gap-5 col-span-2">
                        {block name='product_details'}
                            <h2 class="text-xl">{l s='Caractéristique Technique' d='Shop.Theme.Catalog'} </h2>
                            {include file='catalog/_partials/product-details.tpl'}
                        {/block}
                    </div>
                </div>
                <p class="flex justify-between w-full md:hidden lg:hidden border-b-8 relative md:grid grid-cols-2 text-lbg-primary text-2xl py-3 md:py-5 font-medium"
                    :class="open_livraison_et_retour ? 
                'border-primary' 
                :'border-primary/25'">
                    <span @click="open_livraison_et_retour = true;" class="cursor-pointer" x-bind:class="!open_livraison_et_retour ? 
                    'opacity-60' 
                    :''">Livraison et retour</span>
                    <button @click="open_livraison_et_retour = !open_livraison_et_retour"
                        class="md:hidden right-3 -bottom-2 w-8 fill-lbg-primary">
                        {* <svg class="transform transition-transfom duration-300 md:hidden right-3 -bottom-2 w-8 fill-lbg-primary" :class="open_livraison_et_retour ? 'rotate-180' : ''" xmlns="http://www.w3.org/2000/svg" height="10" viewBox="0 0 8.024 5.982">
                            <path id="Tracé_1348" data-name="Tracé 1348" d="M9341.332,1216l3.316,4.786,3.315-4.786" transform="translate(-9340.636 -1215.304)" fill="none" stroke="#191310" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/>
                        </svg>  *}
                        <svg xmlns="http://www.w3.org/2000/svg"
                            class="transform transition-transfom duration-300 md:hidden right-3 -bottom-2 w-8 fill-lbg-primary"
                            :class="!open_livraison_et_retour ? 'rotate-180' : ''" viewBox="0 -960 960 960">
                            <path d="m296-345-56-56 240-240 240 240-56 56-184-184-184 184Z" />
                        </svg>
                    </button>
                </p>
                <div x-cloak x-show="open_livraison_et_retour" class="grid md:grid-cols-5 gap-10 md:gap-20 py-10 px-5 ">
                    <div class="flex flex-col gap-5 md:gap-10 col-span-3">
                        <h2 class="text-xl font-medium">{l s='Les modes de livraison possible' d='Shop.Theme.Catalog'}</h2>
                        <div class="md:px-0">
                            {l 
                                                    s='
                                    [strong]Livraison à votre domicile ou en point relais :[/strong]
                                    [ul]
                                        [li]Colissimo et Lettre Suivie (gratuite dès 49 euros d\'achat)[/li]
                                        [li]Chronopost[/li]
                                    [/ul]
                                    [strong]Vous avez également la possibilité de retirer gratuitement votre commande à notre dépôt :[/strong]
                                    [br]1 A rue Eugène Maréchal, 69200 Vénissieux[br][br]
                                    Nous nous engageons à préparer toutes nos commandes sous 1 jour ouvré[br]
                                    pour minimiser les retards et assurer que les enfants reçoivent leurs jouetsau plus vite
                                '
                                                    sprintf=[
                                                        '[strong]' => '<strong>',
                                                        '[/strong]' => '</strong>',
                                                        '[ul]' => '<ul class="dash-list">',
                                                        '[li]' => '<li>',
                                                        '[/li]' => '</li>',
                                                        '[/ul]' => '</ul>',
                                                        '[br]' => '<br/>'
                                                    ] 
                                                    d='Shop.Theme.Catalog'
                                                }
                        </div>
                    </div>
                    <div class="flex flex-col gap-10 col-span-2">
                        <h2 class="text-xl font-medium">{l s='Retour' d='Shop.Theme.Catalog'}</h2>
                        <div class="md:px-0 px-3">
                            {l 
                                                    s='
                                    Si le jeu ou le jouet ne convient pas, vous disposez de 14 jours,
                                    à compter de la date de réception, pour retourner votre commande.[br]
                                    Vous pourrez ainsi obtenir un remboursement ou un bon d\'achat[br][br]
                                    [1]#[2][/2]Condition générales de ventes[/1]
                                ' 
                                                    sprintf=[
                                                        '[br]' => '<br/>',
                                                        '[1]' => '<a href="',
                                                        '[2]' => '" class="underline text-blue-500">',
                                                        '[/2]' => '',
                                                        '[/1]' => '</a>'
                                                    ]
                                                    d='Shop.Theme.Catalog'
                                                }
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="px-4 mx-auto mb-4" style="max-width: 85rem;">
            {block name='product_attachments'}
                {if $product.attachments}
                    <div class="flex flex-col gap-2 col-span-4">
                        <h2 class="font-medium text-xl">{l s='Attachments' d='Shop.Theme.Catalog'}</h2>
                        <div class="tab-pane fade in" id="attachments" role="tabpanel">
                            <section class="product-attachments">
                                {foreach from=$product.attachments item=attachment}
                                    {* <pre>{$attachment|@var_dump}</pre> *}
                                    <div class="attachment">
                                        <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                            {$attachment.name} ({$attachment.file_size_formatted})
                                        </a>
                                    </div>
                                    {* <div class="attachment">
                                        <h4><a
                                                href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a>
                                        </h4>
                                        <p>{$attachment.description}</p>
                                        <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                                            {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                                        </a>
                                    </div> *}
                                {/foreach}
                            </section>
                        </div>
                    </div>
                {/if}
            {/block}

            {assign var="nom_expert" value=$wx_customshop->get_acf_value('NOM_EXPERT', $product.id)}
            {assign var="url_photo_expert" value=$wx_customshop->get_acf_value('PHOTO_EXPERT', $product.id)}
            {assign var="question_expert" value=$wx_customshop->get_acf_value('QUESTION_EXPERT', $product.id)}
            {assign var="parole_expert" value=$wx_customshop->get_acf_value('PAROLE_EXPERT', $product.id)}
            {assign var="libele_btn_expert" value=$wx_customshop->get_acf_value('Libelle_bouton', $product.id)}
            {assign var="lien_btn_expert" value=$wx_customshop->get_acf_value('Lien_bouton', $product.id)}

            {if $parole_expert}
                <div class="w-full p-5 flex flex-col md:flex-row gap-10 bg-lbg-secondary">
                    <h2 class="md:hidden text-[1.9rem]">Conseil de l'expert</h2>
            <div class="md:ml-4 flex flex-col gap-5">
                <div class=" h-80 md:h-52  w-full md:w-52 bg-white">
                    <img class="h-full w-full lg:w-full lg:h-full object-cover" src="{$url_photo_expert}"
                        alt="{$nom_expert}" />
                </div>
                <small class="hidden md:block text-gray-500 text-center">{$nom_expert}</small>
            </div>
            <div class="flex flex-col gap-5">
                <p class="hidden md:block text-2xl">Conseil de l'expert</p>
                        <small class="-mt-3 text-[.9rem] font-bold">{$question_expert}</small>
                        <div x-data="{ expanded: false }">
                            <div x-show="expanded" x-cloak>
                                <p class="text-[.9rem]">{$parole_expert nofilter}</p>
                            </div>
                            <div x-show="!expanded" x-cloak>
                                <p class="text-[.9rem]">{$parole_expert|truncate:608:'...' nofilter}</p>
                            </div>
                            {if !($parole_expert|strlen <= 608)}
                                <button @click="expanded = !expanded" class="mt-1">
                                    <span class="text-blue-500 underline text-[.9rem]" x-show="!expanded" x-cloak>Voir plus</span>
                                    <span class="text-blue-500 underline text-[.9rem]" x-show="expanded" x-cloak>Voir moins</span>
                                </button>
                            {/if}
                        </div>

                        <a href="{$lien_btn_expert}"
                            class="flex items-center justify-center my-16 m-auto md:m-0 w-52 bg-white h-10 border-2 rounded hover:bg-primary text-lbg-primary hover:text-white text-lbg-primary border-primary text-lbg-primary ">
                            <span class="text-current">{$libele_btn_expert}</span>
                        </a>
                    </div>
                </div>
            {/if}

            {block name="product_extra"}
                {if $product.extraContent}
                    <div class="flex flex-col">
                        {foreach from=$product.extraContent item=extra key=extraKey}
                            {if $extra.moduleName == "steavisgarantis"}
                                <h2 class="font-medium text-2xl mb-8">
                                    {l s='Avis client sur le produit : %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Actions'}
                                </h2>
                            {else}
                                <h2 class="font-medium text-2xl">{$extra.title}</h2>
                            {/if}
                            <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" role="tabpanel"
                                {foreach $extra.attr as $key => $val} {$key}="{$val}" {/foreach}>
                                {$extra.content nofilter}
                            </div>
                        {/foreach}
                    </div>
                {/if}
            {/block}
            {block name='product_accessories'}
                {if $accessories}
                    <div class="flex flex-col gap-10 col-span-2">
                        <section class="product-accessories clearfix hidden">
                            <p class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
                            <div class="products row">
                                {foreach from=$accessories item="product_accessory" key="position"}
                                    {block name='product_miniature'}
                                        {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory position=$position productClasses="col-xs-6 col-lg-4 col-xl-3"}
                                    {/block}
                                {/foreach}
                            </div>
                        </section>
                    </div>
                {/if}
            {/block}
        </section>

        {* Reco Nuukik *}
        <div class="mb-8">
            {hook h='displayWxProductButtons'}
        </div>
        {* {hook h='displayRecoFPMobile'} *}

        {block name='product_images_modal'}
            {include file='catalog/_partials/product-images-modal.tpl'}
        {/block}

        {block name='page_footer_container'}
            <footer class="page-footer my-4">
                {block name='page_footer'}
                    {hook h='displayProductListReviews' product=$product}
                {/block}
            </footer>
        {/block}
    </div>

{/block}