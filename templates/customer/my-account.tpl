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
{extends file='customer/page.tpl'}

{assign var="is_my_account" value=true scope="global"}
{block name='page_content'}
  {* {$page.page_name|dump} *}
  <main
    class="w-full mx-auto flex px-2 md:px-4 {if $page.page_name != "guest-tracking"} pt-4 md:pt-10 {else} pt-4 {/if} justify-start"
    style="max-width: 85rem;">
    <section class=" w-full" id="menu-espace-client">
      {* my-account *}
      {* {$page.page_name} *}
      {if $page.page_name === "my-account"}
        <div class="flex flex-col md:hidden">
          <p class="text-xl pb-5">{l s='Votre espace client' d='Shop.Theme.Customeraccount'}</p>
          <p class="text-sm pb-5">
            <a href="{$urls.actions.logout}" class="underline text-red-500">
              {l s='Déconnexion' d='Shop.Theme.Customeraccount'}
            </a>
          </p>
          <p class="text-sm mb-5">
            <span class="">{l s='Gérer vos informations, suivre vos commandes, etc.' d='Shop.Theme.Customeraccount'}</span>
          </p>
        </div>
      {elseif $page.page_name === "guest-tracking"}
        <div class="md:hidden">
          <h1 class="border-gray-400  border-b-2 relative -top-3 text-2xl">
            {block name='wx_guest_tracking_page_title'}{/block}
          </h1>
        </div>
      {/if}
      <div class="hidden md:flex w-full">
        {if $page.page_name != "guest-tracking"}
          <div class="relative font-semibold px-4 p-2 flex flex-col w-1/5 rounded-tr-lg lbg-bg-gray-menu-user">
            <p class="h-full border-b-2 border-gray-400">
              <span class="text-xl">{l s='Your account' d='Shop.Theme.Customeraccount'}</span>
            </p>
          </div>
        {/if}
        <div class="relative {if $page.page_name != "guest-tracking"}px-10 p-2 w-4/5 {else} w-full {/if} flex flex-col">
          <div
            class="{if $page.page_name == "my-account"} border-transparent {else} border-gray-400 {/if} border-b-2 h-full ">
            <h1 class="relative -top-3 text-2xl">
              {block name='wx_menu_page_title'}{/block}
            </h1>
          </div>
        </div>
      </div>
      <div class="md:flex w-full">
        {if $page.page_name != "guest-tracking"}
          <div
            class="{if $page.page_name == "my-account"} flex flex-col {else} hidden md:flex md:flex-col {/if} w-full md:w-1/5">
            <div class="h-auto py-3 flex flex-col gap-5 md:gap-2 text-lg rounded-br-lg md:lbg-bg-gray-menu-user">
              <a href="{$urls.pages.identity}"
                class="{if $page.page_name == "identity"} text-lbg-primary bg-white {/if} pl-1 md:pl-4 border-b-2 border-gray-400 md:border-transparent flex items-center menu-client-item justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
                {l s='Mes informations' d='Shop.Theme.Customeraccount'}
                <svg
                  class="opacity-100 {if $page.page_name == "identity"} md:opacity-100 {else} md:opacity-0 {/if} group-hover:opacity-100 transition-opacity"
                  xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
                  <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961"
                    transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round"
                    stroke-linejoin="round" stroke-width="3" />
                </svg>
              </a>
              <a href="{$urls.pages.addresses}"
                class="{if $page.page_name == "addresses" || $page.page_name == "address"} text-lbg-primary bg-white {/if} pl-1 md:pl-4 border-b-2 border-gray-400 md:border-transparent flex items-center menu-client-item justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
                {l s='Mes adresses' d='Shop.Theme.Customeraccount'}
                <svg
                  class="opacity-100 {if $page.page_name == "addresses" || $page.page_name == "address"} md:opacity-100 {else} md:opacity-0 {/if} group-hover:opacity-100 transition-opacity"
                  xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
                  <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961"
                    transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round"
                    stroke-linejoin="round" stroke-width="3" />
                </svg>
              </a>
              <a href="{$urls.pages.history}"
                class="{if $page.page_name == "history" || $page.page_name == "order-detail"} text-lbg-primary bg-white {/if} pl-1 md:pl-4 border-b-2 border-gray-400 md:border-transparent flex items-center menu-client-item justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
                {l s='Mes commandes' d='Shop.Theme.Customeraccount'}
                <svg
                  class="opacity-100 {if $page.page_name == "history" || $page.page_name == "order-detail"} md:opacity-100 {else} md:opacity-0 {/if} group-hover:opacity-100 transition-opacity"
                  xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
                  <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961"
                    transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round"
                    stroke-linejoin="round" stroke-width="3" />
                </svg>
              </a>
              {if $configuration.voucher_enabled && !$configuration.is_catalog}
                <a href="{$urls.pages.discount}"
                  class="{if $page.page_name == "discount"} text-lbg-primary bg-white {/if} pl-1 md:pl-4 border-b-2 border-gray-400 md:border-transparent flex items-center menu-client-item justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
                  {l s='Mes bons d’achat' d='Shop.Theme.Customeraccount'}
                  {* # {l s='Réduction appliquée' d='Shop.Theme.Customeraccount'} *}
                  <svg
                    class="opacity-100 {if $page.page_name == "discount"} md:opacity-100 {else} md:opacity-0 {/if} group-hover:opacity-100 transition-opacity"
                    xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
                    <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961"
                      transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round"
                      stroke-linejoin="round" stroke-width="3" />
                  </svg>
                </a>
              {/if}

              {hook h='displayMyAccountBlock'}
              {* <a href="{$urls.pages.discount}"
                class="flex justify-center items-center menu-client-item flex justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
                {l s='Mes cartes cadeaux' d='Shop.Theme.Customeraccount'}
                <svg class="opacity-0 group-hover:opacity-100 transition-opacity" xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
                  <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961" transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                </svg>
              </a> *}
              {* <a href="{url entity='module' name='ps_emailalerts' controller='account'}"
                class="flex justify-center items-center menu-client-item flex justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
                {l s='Mes alertes' d='Shop.Theme.Customeraccount'}
                <svg class="opacity-0 group-hover:opacity-100 transition-opacity" xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
                  <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961" transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                </svg>
              </a> *}
              {* {if $configuration.return_enabled && !$configuration.is_catalog} *}
                {* <a href="{$urls.pages.order_follow}"
                  class="flex justify-center items-center menu-client-item flex justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
                  {l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
                  <svg class="opacity-0 group-hover:opacity-100 transition-opacity" xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
                    <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961" transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                  </svg>
                </a> *}
              {* {/if} *}
              {* <a href="{$link->getPageLink('mes-favoris', true)|escape:'html'}"
                class="flex justify-center items-center menu-client-item flex justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
                {l s='Mes favoris' d='Shop.Theme.Customeraccount'}
                <svg class="opacity-0 group-hover:opacity-100 transition-opacity" xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
                  <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961" transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
                </svg>
              </a> *}
              <div
                class="hidden md:flex justify-between px-4 p-2 w-full cursor-pointer group hover:bg-white  hover:text-gray-400 transition-opacity">
                <a href="{$urls.actions.logout}" class="text-red-500">
                  {l s='Déconnexion' d='Shop.Theme.Actions'}
                </a>
              </div>
            </div>
          </div>
        {/if}
        <div class="flex flex-col {if $page.page_name != "guest-tracking"} px-0 md:px-10 {/if} w-full md:w-4/5">
          {if $page.page_name != "guest-tracking"}
            <div
              class="{if $page.page_name == "my-account"} hidden {else} flex items-center md:hidden {/if} pb-4 md:pb-2 text-2xl border-b-2 border-gray-300">
              <a class="w-6 h-6 flex items-center" {if $page.page_name != "order-detail"}href="{$urls.pages.my_account}"
                {else}onclick="history.back(); return false;" 
                {/if}>
                <svg xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
                  <path id="Tracé_1500" data-name="Tracé 1500" d="M365.84,405.671l-7.431,6.409,7.431,5.96"
                    transform="translate(-356.909 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round"
                    stroke-linejoin="round" stroke-width="3" />
                </svg>
              </a>
              <div class="">
                {if $page.page_name == "identity"}
                  {l s='Mes informations' d='Shop.Theme.Customeraccount'}
                {elseif $page.page_name == "addresses" || $page.page_name == "address"}
                  {l s='Mes adresses' d='Shop.Theme.Customeraccount'}
                {elseif $page.page_name == "history"}
                  {l s='Mes commandes' d='Shop.Theme.Customeraccount'}
                {elseif $page.page_name == "order-detail"}
                  {l
                                s='Détails de ma commande N°%ref%'
                                sprintf=[
                                  '%ref%' => $order.details.reference
                                ]
                                d='Shop.Theme.Customeraccount'
                              }
                {elseif $page.page_name == "discount"}
                  {l s='Mes bons d’achat' d='Shop.Theme.Customeraccount'}
                {elseif $page.page_name == "module-everpsgift-gifts"}
                  {l s='Mes cartes cadeaux' mod='everpsgift'}
                {elseif $page.page_name == "module-ps_emailalerts-account"}
                  <div class="flex flex-col">
                    <div class="text-2xl">{l s='Mes alertes' d='Modules.Emailalerts.Shop'}</div>
                    <p class="text-xs">
                      {l s='Produits pour lesquels vous avez demandé à recevoir un email lors du retour en stock' d='Modules.Emailalerts.Shop'}
                    </p>
                  </div>
                {elseif $page.page_name == "module-blockwishlist-lists"}
                  {l s='Mes favoris' d='Shop.Theme.Customeraccount'}
                {/if}
              </div>
            </div>
          {/if}
          {block name='wx_container_menu_items'}{/block}
        </div>
      </div>
    </section>
  </main>
{/block}


{* {block name='page_footer'}
  {block name='my_account_links'}
    <div class="text-sm-center">
      <a href="{$urls.actions.logout}">
        {l s='Sign out' d='Shop.Theme.Actions'}
      </a>
    </div>
  {/block}
{/block} *}