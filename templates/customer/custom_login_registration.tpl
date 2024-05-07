<!-- Le template doit ?tendre le template parent des étapes du tunnel de commande -->
{extends file='page.tpl'}
 
{block name='page_title'}
  <div class="flex space-x-2 items-center m-2 hidden">
      <div class="border rounded-full p-6">
          <svg id="User" class="text-" xmlns="http://www.w3.org/2000/svg" width="24.123" height="24.161" viewBox="0 0 24.123 24.161">
              <g id="Groupe_2089" data-name="Groupe 2089">
                <path id="Tracé_1250" data-name="Tracé 1250" d="M183.257,78.041a6.929,6.929,0,0,0,4.637-1.658,5.8,5.8,0,0,0,1.927-4.4s0-.009,0-.013c.013-.169.022-.339.022-.512a6.593,6.593,0,0,0-6.332-6.58c-.085,0-.169-.006-.255-.006-3.114,0-5.449,1.683-6.159,4.255a6.584,6.584,0,0,0,6.159,8.917Zm0-1.411c-2.983,0-4.91-1.761-4.91-4.486a5.164,5.164,0,0,1,1.953-3.775,6.544,6.544,0,0,1,4.114-1.656c3.321,0,4.018,2.579,4.018,4.742A5.181,5.181,0,0,1,183.257,76.63Z" transform="translate(-170.965 -64.869)" fill="#342922"/>
                <path id="Tracé_1251" data-name="Tracé 1251" d="M128.841,241.009a15.778,15.778,0,0,0-17.2,0,7.942,7.942,0,0,0-3.689,6.418.909.909,0,0,0,.564.775.328.328,0,0,0,.055,0,.3.3,0,0,0,.282-.212c2.43-6.8,6.276-8.085,12.523-8.085,6.161,0,8.036,4.31,9.543,7.773a.919.919,0,0,0,.911.45.238.238,0,0,0,.228-.178C132.224,247.418,131.147,242.654,128.841,241.009Z" transform="translate(-107.947 -224.046)" fill="#342922"/>
              </g>
          </svg>  
      </div>
      <div class="">
          <p class="my-0 text-xl md:text-3xl">{l s='Espace membre' d='Shop.Theme.Customeraccount'}</p>
          <p class="my-1">{l s='Your account' d='Shop.Theme.Customeraccount'}</p>
      </div>
  </div>
{/block}

<!-- Le contenu doit doit être dans le block step content -->
{block name='page_content'}
    {if (isset($custom_authentication_email) && $custom_authentication_email != false && !$custom_authentication_is_user_connect && (!$custom_authentication_is_user_connect))}
    <div class="mx-auto rounded {if !($custom_authentication_is_customer_exist == false && !$custom_authentication_is_user_connect)} max-w-xl md:pl-6 {else} max-w-xl md:pl-6 {/if}">
        <!-- Tabs -->
        <ul id="wx-tabs" class="inline-flex w-full justify-center md:px-1 pt-2 {if $page.page_name == "authentication"} {/if}">
            {* {if ($custom_authentication_is_customer_exist != false && !$custom_authentication_is_user_connect)} *}
            {if (!$custom_authentication_is_user_connect)}
                <li class="hidden">
                    {$custom_authentication_email}
                    <a href="#first">
                        <span class="ml-2 cursor-pointer underline lbg-text-primary">{l s='modifier' d='Shop.Theme.Customeraccount'}</span>
                    </a>
                </li>
            {/if}
            {if ($custom_authentication_is_customer_exist != false && !$custom_authentication_is_user_connect)}
                <li class="hidden  font-semibold text-gray-800 rounded-t opacity-50">
                    <a id="wx-default-tab" href="#second">{l s="Mot de passe" d='Shop.Theme.Checkout'}</a>
                </li>
            {/if}
            {if ($custom_authentication_is_customer_exist == false && !$custom_authentication_is_user_connect)}
                <li class="hidden  px-4 py-2 font-semibold text-gray-800 rounded-t opacity-50">
                    <a id="wx-default-tab" href="#third">{l s="Informations Personnelles" d='Shop.Theme.Checkout'}</a>
                </li>
            {/if}
        </ul>

        <!-- Tab Contents -->
        <div id="wx-tab-contents" x-data="{ editEmail: false }">
            <div id="first" x-show="editEmail" x-cloak>
    {/if}
                <div class="custom-checkout-step p-4 {if $page.page_name == "authentication"} md:m-0 max-w-xl mx-auto{/if} md:p-8 md:rounded-lg bg-white md:shadow-lg">
                    <div class="max-w-md mx-auto pb-4 mb-6 border-gray-400">
                        <h1 class="px-1 md:px-0 text-2xl md:text-2xl font-bold">{l s='Se connecter / créer un compte' d='Shop.Theme.Customeraccount'}</h1>
                    </div>
                    <form class="max-w-md mx-auto" method="POST" action="">
                        <div class="mb-6 md:mb-12">
                            {* <label for="email" class="block text-sm font-medium text-gray-700">{l s='Adresse e-mail' d='Shop.Theme.Customeraccount'}</label> *}
                            <div class="relative">
                                <input type="hidden" name="{$custom_authentication}" value="{$custom_authentication}"/>
                                <input 
                                id="email" 
                                type="email" 
                                autofocus 
                                name="custom_authentication_email" 
                                {if isset($custom_authentication_email)}value="{$custom_authentication_email}"{/if} 
                                autocomplete="email" 
                                placeholder="{l s='Entrer votre adresse mail' d='Shop.Theme.Customeraccount'}"
                                required 
                                class="w-full border-b-2 pb-1.5 rounded-none text-sm focus:border-focused">
                                {* <div class="absolute bottom-0 left-0 w-full h-0.5 bg-lbg-primary"></div> *}
                            </div>
                        </div>
                        <!-- Vous pouvez ajouter des champs supplémentaires comme le mot de passe ici -->
                        <div class="flex items-center justify-between">
                            {* <button type="submit" class="bg-lbg-primary text-white font-semibold py-2 px-4 rounded-md focus:outline-none focus:ring focus:ring-green-500 focus:ring-opacity-50">{l s='Se connecter' d='Shop.Theme.Customeraccount'}</button> *}
                            <input 
                            type="submit" 
                            name="submitCustomAuth" 
                            value="{l s='Se connecter' d='Shop.Theme.Customeraccount'}"
                            class="hidden md:block cursor-pointer bg-lbg-primary w-1/3 text-white hover:bg-primary text-sm  py-2 px-4 rounded-sm focus:outline-none focus:ring focus:ring-green-500 focus:ring-opacity-50"/> 
                            <input 
                            type="submit" 
                            name="submitCustomAuth" 
                            value="{l s='Continuer' d='Shop.Theme.Customeraccount'}"
                            class="block md:hidden cursor-pointer bg-lbg-primary w-full text-white hover:bg-primary text-sm py-3 px-4 rounded-sm focus:outline-none focus:ring focus:ring-green-500 focus:ring-opacity-50"/> 
                            <!-- Vous pouvez ajouter un lien vers la page de récupération de mot de passe ici -->
                            <a href="#" class="hidden text-sm text-green-500 hover:text-green-600">{l s='Mot de passe oublié ?' d='Shop.Theme.Customeraccount'}</a> 
                        </div>
                    </form>
                </div>

    {if (isset($custom_authentication_email) && $custom_authentication_email != false && !$custom_authentication_is_user_connect && (!$custom_authentication_is_user_connect))}
            </div>
            {if ($custom_authentication_is_customer_exist != false && !$custom_authentication_is_user_connect)}
                <div id="second" x-show="!editEmail" x-cloak class="pt-0 p-4 w-full {if $page.page_name == "authentication"} {/if} md:p-8 md:rounded-lg bg-white md:shadow-lg">
                    <div class="max-w-md mx-auto pb-4 mb-3 border-gray-400">
                        <h1 class="px-1 md:px-0 text-2xl md:text-2xl font-bold">
                            <span class="hidden md:inline">{l s='Se connecter' d='Shop.Theme.Customeraccount'}</span>
                            <span class="inline md:hidden">{l s='Se connecter à compte' d='Shop.Theme.Customeraccount'}</span>
                        </h1>
                    </div>
                    {assign var="checkout_custom_step_email" value=$custom_authentication_email scope="global"}
                    {assign var="checkout_custom_step_is_valid_mail" value=$custom_authentication_is_valid_mail scope="global"}
                    {assign var="checkout_custom_step_is_customer_exist" value=$custom_authentication_is_customer_exist scope="global"}
                    {assign var="login_form" value=$login_form scope="global"}
                    <div class="tab-pane w-full" id="checkout-login-form" role="tabpanel">
                        {if (!$custom_authentication_is_user_connect)}
                            {assign var="found_email" value=$custom_authentication_email}
                        {else}
                            {assign var="found_email" value=""}
                        {/if}
                        {render file='customer/authentication.tpl' ui=$login_form found_email=$found_email}
                    </div>
                </div>
            {/if}
            {if ($custom_authentication_is_customer_exist == false && !$custom_authentication_is_user_connect)}
                <div id="third" x-show="!editEmail" x-cloak class="pt-0 p-4 w-full {if $page.page_name == "authentication"}  {/if} md:p-8 md:rounded-lg bg-white md:shadow-lg">
                    <div class="max-w-md mx-auto pb-4 mb-3 border-gray-400">
                        <h1 class="px-1 md:px-0 text-2xl md:text-2xl font-bold">
                            <span class="hidden md:inline">{l s='Créer mon compte' d='Shop.Theme.Customeraccount'}</span>
                            <span class="inline md:hidden">{l s='Créer un compte' d='Shop.Theme.Customeraccount'}</span>
                        </h1>
                    </div> 
                    {assign var="custom_authentication_email" value=$custom_authentication_email scope="global"}
                    {assign var="custom_authentication_is_valid_mail" value=$custom_authentication_is_valid_mail scope="global"}
                    {assign var="custom_authentication_is_customer_exist" value=$custom_authentication_is_customer_exist scope="global"}
                    {assign var="register_form" value=$register_form scope="global"}
                    <div class="tab-pane" id="checkout-login-form" role="tabpanel">
                        {render file='customer/registration.tpl' ui=$register_form}
                    </div>
                </div>
            {/if}
        </div>
    </div>
    {/if}
{/block}
