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

{block name='steavisgarantis'}
    {* {$page.page_name} *}
    {if !in_array($page.page_name, ["my-account", "checkout", "cart", "order-detail", "authentication", "identity", "addresses","history", "discount", "module-everpsgift-gifts", "module-ps_emailalerts-account", "module-blockwishlist-lists"])}
    <div class="mx-auto lg:px-4 lg:mt-10" style="max-width: 85rem;">
        <h2 class="font-semibold text-2xl md:text-3xl mb-6 hidden md:block">{l s='Des parents et des enfants satisfaits' d='Shop.Theme.Global'}</h2>
        <style>
            .ets_baw_display_banner {
            margin-bottom: 0 !important;
            }

            {literal}
            * {-webkit-font-smoothing: antialiased;}
            /*# WIDGET LATERAL*/
            #steavisgarantisFooter {
                display: block;
                line-height: 0;
                text-align: center;
                padding-bottom: 10px
            }

            #steavisgarantisFooter {
                background: #ffffff;
                /* Old browsers */
            }

            .agWidget {
                color: #111111;
                font-family: 'Open Sans', sans-serif;
                font-weight: 400
            }

            .rad{-moz-border-radius: 8px;-webkit-border-radius:8px; border-radius:8px;}
            /*boutons*/
            .agBt {
                display: inline-block;
                background: #1c5399;
                border: 1px solid #1c5399;
                color: #ffffff !important;
                font-size: 10px;
                line-height: 10px;
                letter-spacing: 1px;
                text-transform: uppercase;
                text-align: center;
                padding: 4px 10px;
                width: auto;
                text-decoration: none !important;
            }

            .agBt:hover {
                background: none;
                color: #1c5399 !important;
                text-decoration: none !important;
            }

            .agBtBig{font-size:11px; line-height:11px; padding:5px 14px;}
            .rad{-moz-border-radius: 8px;-webkit-border-radius:8px; border-radius:8px;}
            .rad4{-moz-border-radius:4px;-webkit-border-radius:4px; border-radius:4px;}
            /*background*/
            /*transition*/
            .agBt {
                -webkit-transition: background 0.4s ease;
                -moz-transition: background 0.4s ease;
                -ms-transition: background 0.4s ease;
                -o-transition: background 0.4s ease;
                transition: background 0.4s ease;
            }

            {/literal}
        </style>
        <div id="steavisgarantisFooter"
            class="mt-4 w-full my-8 md:border md:p-4 agWidget rad {$language.iso_code|escape:'htmlall':'UTF-8'}">
            <iframe width="100%" height="200" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
            src="{"//www.societe-des-avis-garantis.fr/"|escape:'htmlall':'UTF-8'}wp-content/plugins/ag-core/widgets/iframe/2/h/?id={5227|escape:'htmlall':'UTF-8'}">
            </iframe>
        </div>
    </div>
    {/if}
{/block}

<div class="lbg-footer relative mt-8 md:mt-12 lg:mt-20" style="background: #FFF9F4;;">
    {block name='hook_footer_before'}
        {hook h='displayFooterBefore'}
    {/block}
    <div class="bottom relative pt-2 md:pt-20" style="background: #CEA0A7;">
        {hook h='displayHomeTab'}
        <div class="row md:gap-8 mt-20 md:my-10 mx-auto" style="max-width: 85rem;">
            <div class="col-md-4 md:pl-0 md:pr-6">
                <div class="w-full mb-7 md:mb-0">
                    <h3 class="text-lg font-bold mb-6">
                        {$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(15)}
                    </h3>
                    <div>
                        {$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(16)}
                    </div>
                </div>
            </div>
            {block name='hook_footer'}
                {hook h='displayFooter'}
            {/block}
        </div>
        <div class="w-full mx-auto" style="max-width: 85rem;border: 1px dashed #FFF3E8;"></div>
        <p class="copyright small">
        {block name='copyright_link'}
            {* <a href="https://www.prestashop.com" target="_blank" rel="noopener noreferrer nofollow">
              {l s='%copyright% %year% - Ecommerce software by %prestashop%' sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
            </a> *}
            <p class="text-center text-sm p-4">© Copyright LesBonsGamins - Tous droits réservés</p>
          {/block}
        </p>
    </div>
</div>


{block name="toast"}
  <div id="snackbar">Some text some message..</div>
 {/block}
 
 {block name="login-modal"}
 <div style="z-index:999;" id="wx-loggin-modal" data-modal-show="true" aria-hidden="true" class="hidden h-full bg-black bg-opacity-20 overflow-x-hidden overflow-y-auto fixed h-modal md:h-full top-0 left-0 right-0 md:inset-0 z-50 justify-center items-center">
  <div class="relative w-full mx-auto max-w-2xl px-4 flex items-center justify-center">
      <!-- Modal content -->
      <div class="bg-white rounded-lg shadow relative">
          <!-- Modal header -->
          <div class="flex items-center justify-between px-6 py-4 border-b rounded-t">
              <p class="text-gray-900 text-xl lg:text-2xl font-semibold my-0">
                Connexion
              </p>
              <button type="button" id="close" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="default-modal">
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
              </button>
          </div>
          <!-- Modal body -->
          <div class="p-6">
            <p id="login-before-action-text" class="mb-0">{l s='Vous devez être connecté avant de pouvoir ajouter un produit à vos favoris!"' d='Shop.Theme.Global'}</p>
            <a id="login-before-action" href="{$urls.pages.authentication}" data-redirect-url="{$smarty.server.REQUEST_URI}" class="lbg-btn primary-btn-full mt-3 block md:w-1/2 text-center mx-auto">Me connecter</a>
          </div>
      </div>
  </div>
 </div>
{/block}
