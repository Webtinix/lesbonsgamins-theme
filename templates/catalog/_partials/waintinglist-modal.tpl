<div style="z-index:999;" data-modal-show="true" aria-hidden="true" x-cloak x-show="modalIsOpen" class="wx-mail-alert-modal h-full bg-black bg-opacity-20 overflow-x-hidden overflow-y-auto fixed h-modal md:h-full top-0 left-0 right-0 md:inset-0 z-50 justify-center items-center">
    <div class="relative w-full h-screen mx-auto max-w-2xl px-4 flex items-center justify-center">
        <!-- Modal content -->
        <div class="bg-white rounded shadow relative" @click.away="{ modalIsOpen = false }">
            <!-- Modal header -->
            <div class="flex items-center justify-between px-6 py-4 border-b border-gray-400 rounded-t">
                <p class="text-gray-900 text-xl lg:text-2xl font-semibold my-0">
                    {l s='Retour produit' d='Shop.Theme.Actions'}
                </p>
                <button type="button" @click="{ modalIsOpen = false }" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="default-modal">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                </button>
            </div>
            <!-- Modal body -->
            <div class="p-6" id="modal-body">
                {block name="product_waitinglist_form"}
                    {* {assign var="has_notification" value=$wx_customshop->customerHasNotification($customer.id, $product.id_product, $product.id_product_attribute)}
                    <div class="tabs mt-0 mb-4">
                        <div class="wx js-mailalert" data-url="{url entity='module' name='ps_emailalerts' controller='actions' params=['process' => 'add']}">
                            {if empty($has_notification)}
                                <p>{l s='Merci de renseigner votre adresse mail afin d\'être notifié du retour de ce produit' d='Modules.Emailalerts.Shop'}</p>
                                <div class="flex flex-col mt-2">
                                    <div class="mt-1">
                                        <input 
                                            placeholder="{l s='Adresse mail' d='Modules.Emailalerts.Shop'}"
                                            type="email" 
                                            name="customer_email" 
                                            class="py-2 border-b-2 border-gray-400 w-full" 
                                            value="{if empty($email)}{$customer.email}{/if}" 
                                        />
                                    </div>
                                </div>
                                <div id="wx-mailalert-alerts" class="mt-4"></div>
                                <button
                                    data-product="{if isset($product)}{$product.id_product}{/if}"
                                    data-product-attribute="{if isset($product)}{$product.id_product_attribute}{/if}"
                                    class="w-11/12 md:w-2/3 mx-auto block bg-lbg-primary text-white rounded mt-4 block text-center js-mailalert-add bg-lbg-primary hover:bg-primary py-2.5"
                                    rel="nofollow">
                                    {l s="Valider" d='Modules.Emailalerts.Shop'}
                                </button>
                            {else}
                                <div class="pt-4 pb-3">
                                    <div class="flex items-center space-x-1 mb-2">
                                        <span class="font-bold text-lbg-primary ">&check;</span>
                                        <span class="text-lbg-primary">E-mail bien pris en compte</span>
                                    </div>
                                    <p class="font-medium">{l s="Dès que le produit sera à nouveau disponible, vous recevrez un e-mail de notification de notre part." d='Modules.Emailalerts.Shop'}</p>
                                </div>
                            {/if}
                        </div>
                    </div> *}

                    {hook h='displayProductAdditionalInfo' product=$product}
                {/block}
            </div>
        </div>
    </div>
</div>