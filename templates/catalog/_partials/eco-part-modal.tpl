<div style="z-index:999;" id="wx-ecopart-modal" data-modal-show="true" aria-hidden="true" class="hidden h-full bg-black bg-opacity-20 overflow-x-hidden overflow-y-auto fixed h-modal md:h-full top-0 left-0 right-0 md:inset-0 z-50 justify-center items-center">
    <div class="relative w-full mx-auto max-w-5xl px-4 flex items-center justify-center">
        <!-- Modal content -->
        <div class="bg-white rounded-lg shadow relative w-full">
            <!-- Modal header -->
            <div class="flex items-center justify-between px-6 py-4 border-b rounded-t">
                <p class="md:pl-6 text-primary font-medium text-xl lg:text-2xl font-semibold mb-0 mt-2">
                {l s='L’ÉCO-PARTICIPATION' d='Shop.Theme.Actions'}
                </p>
                <button type="button" id="close" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="default-modal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                </button>
            </div>
            <!-- Modal body -->
            <div class="overflow-y-scroll md:overflow-y-hidden lbg-scrollbar" id="modal-body" style="max-height: 85vh;">
                <div class="flex flex-col md:flex-row">
                    <div id="p-ecopart" class="w-full md:w-8/12 p-6 md:pl-12 md:pr-16 pb-12 overflow-y-auto lbg-scrollbar border-b md:border-b-0" style="height: 400px;">
                        <p class="font-medium text-xl lg:text-2xl font-semibold mt-0 mb-4">C'est quoi ?</p>
                        <p>
                            L’éco-participation est une contribution qui s’applique obligatoirement sur le prix de certains produits. Elle permet de financer la collecte, le tri, le recyclage et/ou la valorisation des produits usagés. Cette contribution est intégralement reversée à un organisme à but non lucratif, agréé par l’État.  Sa mission est de développer la collecte des produits, d’assurer leur valorisation en fin de vie et de promouvoir le réemploi et la réutilisation.
                        </p>
                        <div class="p-second-part hidden">
                            <p class="font-medium text-xl lg:text-2xl font-semibold mt-0 mb-4">À quoi sert-elle ?</p>
                            <p>Elle permet de financer le tri, la collecte, le recyclage et la valorisation du mobilier usagé.</p>
                            <p class="font-medium text-xl lg:text-2xl font-semibold mt-0 mb-4">Comment ça marche concrètement ?</p>
                            <p>
                                L’éco-organisme met en place des solutions de collecte des produits usagés en partenariat avec les collectivités locales, les associations de l’économie sociale et solidaire, les professionnels volontaires et les logisticiens.
                            </p>
                            <p class="font-medium text-xl lg:text-2xl font-semibold mt-0 mb-4">Vous aussi</p>
                            <p>
                                Donnez une seconde vie à vos produits. Lorsque vous souhaitez vous en débarrasser, si votre produit est en bon état, vous pouvez le donner à une structure de l’économie sociale et solidaire, autour de vous, le revendre sur le marché de l’occasion. Sinon vous pouvez le déposer à la déchèterie. Les produits collectés dans les bennes sont acheminés dans des centres de tri où les matériaux sont séparés par flux (bois, matelas, ferraille, plastique…) pour être envoyés en recyclage et servir à fabriquer d’autres produits.                        
                            </p>
                        </div>
                        <button id="learn-more-ecopart" class="text-primary underline">En savoir plus</button>
                    </div>
                    <script>
                        $('#learn-more-ecopart').on('click', function(){
                            $('#wx-ecopart-modal .p-second-part').toggleClass('hidden');
                            if($('#wx-ecopart-modal .p-second-part').hasClass('hidden')) {
                                $(this).text('En savoir plus');
                            } else {
                                $(this).text('Voir moins');
                            }
                        });
                    </script>
                    <div class="w-full md:w-4/12 border-l-2 p-5">
                        {block name='page_header'}
                            {assign var='h1_text' value={widget name='advancedcustomfields' hook='h_1'} }
                            {assign var="h1_text" value=trim(preg_replace('/<!--(.|\s)*?-->/', '', $h1_text))}
                            <p class="my-0 text-lg">{if $h1_text != ""}{$h1_text}{else}{$product.name}{/if}</p>
                            {if $product.id_manufacturer && Manufacturer::getNameById((int) $product.id_manufacturer)}
                            <p>
                                <a href="{$link->getmanufacturerLink($product.id_manufacturer)}" class="text-base font-medium manufacturer">
                                    {Manufacturer::getNameById((int) $product.id_manufacturer)}
                                </a>
                            </p>
                            {/if}
                        {/block}
                        <div class="w-full flex justify-between items-center">
                            <p class="text-sm">Hors éco-participation</p>
                            {assign var=price_ecotax_excl value=($product.price_tax_exc - floatval($product.ecotax['value']))}
                            <p class="text-sm">{round($price_ecotax_excl, 2)} {$currency.sign}</p>
                        </div>
                        <div class="w-full flex justify-between">
                            <p class="text-sm">Dont Éco-participation Mobilier</p>
                            <p class="text-sm">{$product.ecotax['value']}</p>
                        </div>
                        <div class="w-full flex justify-between border-t-2">
                            <p class="">Prix total</p>
                            <p class="my-1 font-bold">
                                <span class="">
                                    <span class='current-price-value regular-product-price'>
                                        {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='product_sheet'}{/capture}
                                        {if '' !== $smarty.capture.custom_price}
                                        {$smarty.capture.custom_price nofilter}
                                        {else}
                                        {assign var=exploded_price value=","|explode:$product.price}
                                        <span class="text-xl">{$exploded_price[0]}</span>,<span class="">{$exploded_price[1]}</span>
                                        {/if}
                                    </span>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>