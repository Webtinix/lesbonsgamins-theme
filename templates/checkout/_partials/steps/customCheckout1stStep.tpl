<!-- Le template doit ếtendre le template parent des étapes du tunnel de commande -->
{extends file='checkout/_partials/steps/checkout-step.tpl'}
 
<!-- Le contenu doit doit être dans le block step content -->
{block name='step_content'}
    {if (isset($checkout_custom_step_email) && $checkout_custom_step_email != false && !$checkout_custom_step_is_user_connect && ($checkout_custom_step_is_customer_exist != false && !$checkout_custom_step_is_user_connect))}
        <div class="mx-auto rounded">
            <!-- Tabs -->
            <ul id="wx-tabs" class="inline-flex w-full px-1 pt-2">
                {if ($checkout_custom_step_is_customer_exist != false && !$checkout_custom_step_is_user_connect)}
                    <li class="">
                        {* {$checkout_custom_step_email}
                        <a href="#first">
                            <span class="ml-2 cursor-pointer underline lbg-text-primary">modifier</span>
                        </a> *}
                    </li>
                {/if}
                {if ($checkout_custom_step_is_customer_exist != false && !$checkout_custom_step_is_user_connect)}
                    <li class="hidden  font-semibold text-gray-800 rounded-t opacity-50">
                        <a id="wx-default-tab" href="#second">{l s="Mot de passe" d='Shop.Theme.Checkout'}</a>
                    </li>
                {/if}
                {if ($checkout_custom_step_is_customer_exist == false && !$checkout_custom_step_is_user_connect)}
                    <li class="px-4 py-2 font-semibold text-gray-800 rounded-t opacity-50">
                        <a id="wx-default-tab" href="#third">{l s="Informations Personnelles" d='Shop.Theme.Checkout'}</a>
                    </li>
                {/if}
            </ul>
            <!-- Tab Contents -->
            {* <style>
                    form#customStepForm input.invalid {
                    border-color: red !important;
                    outline: none;
                    box-shadow: none;
                }

            </style> *}
            <div id="wx-tab-contents" x-data="{ editEmail: false }">
                <div id="first" x-show="editEmail" x-cloak>
    {/if}
                    <div class="custom-checkout-step">
                        <div class="border-b pb-4 mb-6 border-gray-400">
                            <p class="text-4xl font-bold">{l s='Mes informations' d='Shop.Theme.Checkout'}</p>
                        </div>
                        <!-- Le formulaire doit envoyer les données sur la page de commande en post -->
                        <form  id="customStepForm" class="md:px-8"
                                method="POST"
                                action="{$urls.pages.order}"
                                data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'customStep']}"
                        >
                            <!-- Les Champs spécifiques de la step avec assignation de la variable si elle existe -->
                            <section class="form-fields">
                                <div class="form-group col-span-12 flex flex-col md:flex-row md:items-end space-y-3 space-x-0 md:space-y-0 md:space-x-8 max-w-xl">
                                    <div class="mt-1 flex-1">
                                        <input type="hidden" name="{$checkout_custom_step}" value="{$checkout_custom_step}"/>
                                        <input type="email" placeholder="Votre adresse mail" autofocus class="w-full border-b-2 pb-1.5 text-sm focus:border-green-500"  name="checkout_custom_step_email" {if isset($checkout_custom_step_email)}value="{$checkout_custom_step_email}"{/if}/>
                                    </div>
                                    <input 
                                        type="submit" name="submitCustomStep" value="{l s="Continuer" d='Shop.Theme.Checkout'}"
                                        class="continue bg-lbg-primary  hover:bg-primary text-white px-12 text-sm cursor-pointer py-2 rounded-sm"
                                    />
                                </div>
                            </section>
                        </form>
                    </div>
    {if (isset($checkout_custom_step_email) && $checkout_custom_step_email != false && !$checkout_custom_step_is_user_connect && ($checkout_custom_step_is_customer_exist != false && !$checkout_custom_step_is_user_connect))}
                </div>
            {if ($checkout_custom_step_is_customer_exist != false && !$checkout_custom_step_is_user_connect)}
                <div id="second" x-show="!editEmail" x-cloak>
                    {assign var="checkout_custom_step_email" value=$checkout_custom_step_email scope="global"}
                    {assign var="checkout_custom_step_is_valid_mail" value=$checkout_custom_step_is_valid_mail scope="global"}
                    {assign var="checkout_custom_step_is_customer_exist" value=$checkout_custom_step_is_customer_exist scope="global"}
                    {assign var="errors_custom_checkout" value=$errors scope="global"}
                    
                    <div class="border-b pb-4 mb-6 border-gray-400">
                        <p class="text-4xl font-bold">{l s='Mes informations' d='Shop.Theme.Checkout'}</p>
                    </div>
                    <div class="tab-pane max-w-lg mb-3" id="checkout-login-form" role="tabpanel">
                        {render file='checkout/_partials/login-form.tpl' ui=$login_form}
                    </div>
                    {* Si cette interface n'est pas appelé pour afficher le titre, on supprime les errors des cookies *}
                    {if isset($show_title) && !$show_title}
                        {$wx_customshop->unsetCookie('error_authetification')}
                    {/if}
                </div>
            {/if}
            {if ($checkout_custom_step_is_customer_exist == false && !$checkout_custom_step_is_user_connect)}
                <div id="third" class="p-4 border">
                    {assign var="checkout_custom_step_email" value=$checkout_custom_step_email scope="global"}
                    {assign var="checkout_custom_step_is_valid_mail" value=$checkout_custom_step_is_valid_mail scope="global"}
                    {assign var="checkout_custom_step_is_customer_exist" value=$checkout_custom_step_is_customer_exist scope="global"}
                    {assign var="errors_custom_checkout" value=$errors scope="global"}
                    
                    <div class="title">
                        <p class="font-medium mt-3 mb-6 pb-3 border-b text-xl md:text-3xl">Entrez vos informations personnelles</p>
                    </div>
                    <div class="tab-pane" id="checkout-login-form" role="tabpanel">
                        {render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
                    </div>
                    {* Si cette interface n'est pas appelé pour afficher le titre, on supprime les errors des cookies *}
                    {if isset($show_title) && !$show_title}
                        {$wx_customshop->unsetCookie('error_authetification')}
                    {/if}
                </div>
            {/if}
            </div>
        </div>
    {/if}
{/block}
