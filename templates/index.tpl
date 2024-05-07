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
{extends file='page.tpl'}

{block name='page_content_container'}
  <main id="content" class="page-home mt-32 pt-2 md:pt-0 md:mt-40">

    {block name='page_content_top'}{/block}

    {block name='page_content'}
      {block name='hook_home'}
        {$HOOK_HOME nofilter}
      {/block}
    {/block}

    <section class="relative bg-lbg-secondary pt-16 md:pt-20 w-full">
      <div class="w-full mx-auto px-4" style="max-width: 85rem; padding-bottom:2rem; margin-bottom:3rem;">
        <h2 class="font-semibold text-2xl md:text-3xl mb-10 md:w-1/2">
          {l s='Des jouets en bois par univers pour faire rêver les petits comme les grands' d='Shop.Theme.Global'}
        </h2>
        <div class=" grid grid-cols-2 md:grid-cols-3 gap-y-8 gap-x-3 md:gap-x-8  my-7">
          {assign var="banner1" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(1)}
          {$banner1 nofilter}
          {assign var="banner2" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(2)}
          {$banner2 nofilter}
          {assign var="banner3" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(3)}
          {$banner3 nofilter}
          {assign var="banner4" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(4)}
          {$banner4 nofilter}
          {assign var="banner5" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(5)}
          {$banner5 nofilter}
          {assign var="banner6" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(6)}
          {$banner6 nofilter}
        </div>
        {* Reassurance *}
        {hook h='displayFooterAfter'}
      </div>
    </section>

    {* Pour Orphée *}
    {hook h='Wx_getProductBlocFranceWood'}
    <div class="w-full mx-auto px-4 py-6 hidden md:block" style="max-width: 85rem;">
      <hr class="w-full" />
    </div>
    {hook h='Wx_getproductblocchildrenloveittoo'}


    {* hopcy :08/02/2024 : update style *}
    <section class="px-[11px] relative bg-lbg-secondary min-h-32 pb-10 pt-10 md:py-28 lg:px-0 w-full">
      {* Hopcy : update 9/02/2024 *}
      <div class="mx-auto px-4 md:px-0 w-full lg:grid grid-cols-2 grid-rows-1 md:gap-16 " style="max-width: 82rem;">
        <div class="flex flex-col gap-5 w-full">
          <h2 class="font-semibold text-2xl md:text-3xl mb-0 md:mb-6">
            {$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(13)}
          </h2>
          {assign var="img1" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(7)}
          {$img1 nofilter}
          <div class="pt-2 md:pt-0">
            {$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(14)}
          </div>
        </div>
        <div class="h-[550px] relative hidden lg:inline-block">
          {* <img src="./src/img/shutterstock_1795321666.png" class="w-[70%]" alt="" srcset=""> *}
          {assign var="img2" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(8)}
          {$img2 nofilter}
          {* <img src="./src/img/pexels-tatiana-syrikova-3932937.png"  class="w-[70%] -z-10 absolute right-0 bottom-0" srcset=""> *}
          {assign var="img3" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(9)}
          {$img3 nofilter}
        </div>
      </div>
    </section>

    
    <section class="px-4 mt-8 md:mt-12 lg:mt-16 lg:px-4 py-15 lg:py-10 mx-auto" style="max-width: 85rem;">
      <h2 class="font-semibold text-2xl md:text-3xl mb-8">{l s='Rejoignez la communauté Les Bons Gamins : conseils, inspirations, échanges' d='Shop.Theme.Global'}</h2>
      {* <div class=" grid grid-cols-2 md:grid-cols-3 gap-y-8 gap-x-3 md:gap-x-8  my-7"> *}
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-y-8 gap-x-3 md:gap-x-8  my-7">
        {assign var="img4" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(10)}
        {$img4 nofilter}

        {assign var="img5" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(11)}
        {$img5 nofilter}

        {assign var="img6" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(12)}
        {$img6 nofilter}
      </div>
    </section>
  </main>
{/block}