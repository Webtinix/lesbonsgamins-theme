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
{block name='header_nav'}
  <div class="w-full bg-cea0a7 hidden md:block">
    <div class="w-full mx-auto relative flex justify-end" style="max-width: 85rem;">
      <p class="text-white p-2 text-sm">
        {l s="Vous avez besoin d'aide ? +33 (0)4 72 96 09 09 ou contact@lesbonsgamins.fr" d='Shop.Theme.Global'}
      </p>
    </div>
  </div>
  <nav class="header-nav mx-auto bg-white" style="max-width: 85rem;">
    <div class="px-4">
      {* <pre> *}
      {* {$wx_steps_checkout|@var_dump} *}
      {* </pre> *}

      <div class="flex flex-col md:flex-row items-center md:gap-8">
        <div class="" id="">
            <div class="hidden md:block">{renderLogo}</div>
            <div class="md:hidden pt-3 pb-1 flex justify-between">
              <img class="w-1/2" src="{$urls.img_url}LBG_Logo_Ligne_Simple.png" alt="Logo Les Bons Gamins" title="Logo Les Bons Gamins" />
              <div>
                <a href="/nous-contacter" target="_blank" class="text-lbg-primary">Besoin d'aide ?</a>
              </div>
            </div>
        </div>
        <div class="flex-1 lg:px-12 py-4 md:py-0">
          <div class="w-full flex items-center space-x-2 md:space-x-6">
            {foreach from=$wx_steps_checkout item=step key=key}
              {* {$step.identifier|@var_dump} *}
              {if $key === 0}
              {else}
                <button class="stepNav flex items-center space-x-1 md:space-x-2" data-step="{$step.identifier}">
                  <span class="flex items-center justify-center rounded-full h-5 md:h-6 w-5 md:w-6 text-xs border {if $step.step_is_current || $step.step_is_complete} border-lbg-primary text-lbg-primary{else} text-silver-C9C7C7 {/if}">
                    {$key}
                  </span>
                  <p class="text-xs md:text-lg font-medium whitespace-nowrap {if $step.step_is_current || $step.step_is_complete} text-lbg-primary{else} text-silver-C9C7C7 {/if}">
                    {if $key === 1}
                      Mes informations
                    {else if $key === 2}
                      <span class="hidden md:block {if $step.step_is_current || $step.step_is_complete} text-lbg-primary{else} text-silver-C9C7C7 {/if}">Choix mode de livraison</span>
                      <span class="md:hidden {if $step.step_is_current || $step.step_is_complete} text-lbg-primary{else} text-silver-C9C7C7 {/if}">Mode de Livraison</span>
                    {else if $key === 3}
                      Paiement
                    {/if}
                  </p>
                </button>

                {if $key < ($wx_steps_checkout|count - 1)}
                <div class="w-2 md:w-32 h-0.5 {if $step.step_is_complete} bg-lbg-primary{else}bg-gray-300{/if}"></div>
                {/if}
              {/if}
            {/foreach}
            <script>
              $('.stepNav').on('click', function (e) {
                const identifier = $(this).data('step')
                $(".checkout-step").addClass("hidden -current")
                $("section#" + identifier + "").removeClass("hidden -current");
                $("section#" + identifier + "").addClass("-current");
              })
            </script>
            {*  *}

            {* <div class="flex items-center space-x-1 md:space-x-2">
              <span class="flex items-center justify-center rounded-full h-5 md:h-6 w-5 md:w-6 text-xs md:text-sm border md:border-2 border-lbg-primary text-lbg-primary">1</span>
              <h3 class="text-xs md:text-lg font-medium whitespace-nowrap text-lbg-primary">Mes informations</h3>
            </div>

            <div class="w-2 md:w-32 h-0.5 bg-gray-300"></div>

            <div class="flex items-center space-x-1 md:space-x-2">
              <span class="flex items-center justify-center rounded-full h-5 md:h-6 w-5 md:w-6 text-xs md:text-sm border md:border-2 border-gray-300 text-gray-300">2</span>
              <h3 class="text-xs md:text-lg font-medium whitespace-nowrap text-gray-300">
                <span class="hidden md:block">Choix mode de livraison</span>
                <span class="md:hidden">Mode de Livraison</span>
              </h3>
            </div>

            <div class="w-2 md:w-32 h-0.5 bg-gray-300"></div>

            <div class="flex items-center space-x-1 md:space-x-2">
              <span class="flex items-center justify-center rounded-full h-5 md:h-6 w-5 md:w-6 text-xs md:text-sm border md:border-2 border-gray-300 text-gray-300">3</span>
              <h3 class="text-xs md:text-lg font-medium whitespace-nowrap text-gray-300">Paiement</h3>
            </div> *}
          </div>
          {* {hook h='displayNav1'} *}
        </div>
      </div>
    </div>
  </nav>
{/block}

{block name='header_top'}
  {* <div class="header-top hidden-md-up">
    <div class="container">
        <div class="row">
        <div class="col-sm-12">
          <div class="row">
            {hook h='displayTop'}
            <div class="clearfix"></div>
          </div>
        </div>
      </div>
      <div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
        <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
        <div class="js-top-menu-bottom">
          <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
          <div id="_mobile_contact_link"></div>
        </div>
      </div>
    </div>
  </div>
  {hook h='displayNavFullWidth'} *}
{/block}
