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

<div class="col-md-2 links wrapper relative md:px-0 py-3 md:pt-0 mb-4 md:mb-0" x-data="{ contentIsOpen: false }">
   {* Hopcy : 9/02/2024 *}
  <div class="flex justify-between items-center md:inline-block" @click="contentIsOpen = !contentIsOpen">
    <p class="text-base font-normal md:font-bold md:text-lg">
      <span class="hidden md:block">{l s='Contact' d='Shop.Theme.Global'}</span>
      <span class="md:hidden">{l s='Siège et dépôt' d='Shop.Theme.Global'}</span>
    </p>
    <button @click="contentIsOpen = !contentIsOpen" class="md:hidden">
      <svg class="transform transition-transfom duration-300" :class="contentIsOpen ? 'rotate-180' : ''" xmlns="http://www.w3.org/2000/svg" height="10" viewBox="0 0 8.024 5.982">
        <path id="Tracé_1348" data-name="Tracé 1348" d="M9341.332,1216l3.316,4.786,3.315-4.786" transform="translate(-9340.636 -1215.304)" fill="none" stroke="#191310" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/>
      </svg>      
    </button>
  </div>
  <div x-show="contentIsOpen" x-cloak id="contact-infos" class="text-black mt-2 md:mt-0" style="font-size:13px;margin-top: 16px;">
    <span>Les Bons Gamins</span><br>
    {if $contact_infos.address.address1}
      {* [1][/1] is for a HTML tag. *}
      {l s='[1]%address1%[/1]'
        sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%address1%' => $contact_infos.address.address1
        ]
        d='Shop.Theme.Global'
      }
    {/if}<br>
    {if $contact_infos.address.address2}
      {* [1][/1] is for a HTML tag. *}
      {l s='[1]%address2%[/1]'
        sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%address2%' => $contact_infos.address.address2
        ]
        d='Shop.Theme.Global'
      }
    {/if}
    {* {if $contact_infos.address.country}
      <br>
      {l s='[1]%country%[/1]'
        sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%country%' => $contact_infos.address.country
        ]
        d='Shop.Theme.Global'
      }
    {/if} *}
    {if $contact_infos.phone}
      <br><br>
      {* [1][/1] is for a HTML tag. *}
      {l s='[1]%phone%[/1]'
        sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%phone%' => $contact_infos.phone
        ]
        d='Shop.Theme.Global'
      }
    {/if}
    <br>
    <span class="text-xs">Lundi au Vendredi : 8h - 12h et 14h - 17h</span>
    {if $contact_infos.fax}
      <br>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='Fax: [1]%fax%[/1]'
        sprintf=[
          '[1]' => '<span>',
          '[/1]' => '</span>',
          '%fax%' => $contact_infos.fax
        ]
        d='Shop.Theme.Global'
      }
    {/if}
    <div class="" style="margin-top: 10px;">
      <img src="{$urls.img_url}image1_societe_des_avis_garantis.png" alt="Image Société des Avis Garantis" title="Image Société des Avis Garantis" />
    </div>
    {*if $contact_infos.email && $display_email}
      <br>
        {l s='' d='Shop.Theme.Global'}
        {mailto address=$contact_infos.email encode="javascript"}
    {/if*}
  </div>

  <div id="contact-infos" class="text-sm text-black mt-2 md:mt-3 hidden md:block">
    <span>Les Bons Gamins</span><br>
    {if $contact_infos.address.address1}
      {* [1][/1] is for a HTML tag. *}
      {l s='[1]%address1%[/1]'
        sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%address1%' => $contact_infos.address.address1
        ]
        d='Shop.Theme.Global'
      }
    {/if}<br>
    {if $contact_infos.address.address2}
      {* [1][/1] is for a HTML tag. *}
      {l s='[1]%address2%[/1]'
        sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%address2%' => $contact_infos.address.address2
        ]
        d='Shop.Theme.Global'
      }
    {/if}
    {* {if $contact_infos.address.country}
      <br>
      {l s='[1]%country%[/1]'
        sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%country%' => $contact_infos.address.country
        ]
        d='Shop.Theme.Global'
      }
    {/if} *}
    {if $contact_infos.phone}
      <br><br>
      {* [1][/1] is for a HTML tag. *}
      {l s='[1]%phone%[/1]'
        sprintf=[
        '[1]' => '<span>',
        '[/1]' => '</span>',
        '%phone%' => $contact_infos.phone
        ]
        d='Shop.Theme.Global'
      }
    {/if}
    <br>
    <span class="text-xs">Lundi au Vendredi : 8h - 12h et 14h - 17h</span>
    {if $contact_infos.fax}
      <br>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='Fax: [1]%fax%[/1]'
        sprintf=[
          '[1]' => '<span>',
          '[/1]' => '</span>',
          '%fax%' => $contact_infos.fax
        ]
        d='Shop.Theme.Global'
      }
    {/if}
    <div class="" style="margin-top: 10px;">
      <img class="h-16" src="{$urls.img_url}image1_societe_des_avis_garantis.png" alt="Image Société des Avis Garantis" title="Image Société des Avis Garantis" />
    </div>
    {*if $contact_infos.email && $display_email}
      <br>
        {l s='' d='Shop.Theme.Global'}
        {mailto address=$contact_infos.email encode="javascript"}
    {/if*}
  </div>
</div>
