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

 {* New added by Webtinix *}
<div x-data="{ open: false }" class="pb-8 md:pb-0">
  {* <div class="row py-16 md:py-20 w-full grid lg:grid-cols-12 lg:gap-x-10 gap-y-4 mx-auto px-4" style="max-width: 85rem;"> *}
  <div class="row py-10 md:py-16 w-full grid lg:grid-cols-12 lg:gap-x-10 gap-y-4 mx-auto px-4" style="max-width: 85rem;">
    <p class="col-span-9 font-bold text-2xl md:text-3xl lg:my-4">Newsletter Les Bons Gamins : offres et avantages fidélités</p>
    <p class="text-sm col-span-9 mb-3">
      Inscrivez-vous à notre newsletter pour ne rien manquer de nos nouveautés, offres exclusives et conseils pratiques. Rejoignez-nous et restez toujours à la page sur l'univers du jeu et du jouet en bois.
    </p>
    <button @click="open = true" class="col-span-12 lg:col-span-3 flex items-center">
      <span class="rounded-l flex place-content-center items-center text-lbg-primary border-lbg-primary border-2 bg-white flex-1 h-11 px-4 text-sm focus:outline-none hover:underline">
        Je m'inscris à la newsletter 
      </span>
      <span name="submitNewsletter" type="submit" class="bg-lbg-primary rounded-r w-16 h-11 flex place-content-center items-center">
        <img width="50%" src="{$urls.img_url}Picto-réseaux-sociaux-mail/Newsletter-mail-creme.png" alt="Picto Newsletter" title="Picto Newsletter" />
      </span>
    </button>
  </div>

  <div x-cloak x-show="open" style="z-index:999;" class="h-full bg-black bg-opacity-20 overflow-x-hidden overflow-y-auto fixed h-modal md:h-full top-0 left-0 right-0 md:inset-0 z-50 justify-center items-center">
    <div class="relative w-full h-96 mx-auto max-w-2xl px-4 flex items-center justify-center relative bg-white rounded-lg shadow-xl md:mt-20">
      <!-- Modal content -->
      <button @click="open = false" type="button" id="close" class="absolute top-0 md:top-2 right-8 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="default-modal">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
      </button>
      <iframe class="w-full h-80" src="https://l.news.lesbonsgamins.fr/T/WF/2533/WdeDe3/Optin/fr-CA/Form.ofsys"></iframe>
    </div>
  </div>
</div>