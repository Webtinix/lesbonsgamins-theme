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

{block name='block_social'}
  <ul class="absolute -top-12 left-0 h-[100px] w-full flex justify-center items-center space-x-3 md:space-x-10">
    <li class="logo">
      <a class="h-20 w-20 md:h-32 md:w-32 block" href="/">
        <img class="h-full w-full object-contain" src="{$urls.img_url}LBG Logo_Rond_Fond bleu.png" alt="logo LBG Rond" title="logo LBG Rond">
      </a>
    </li>
    {foreach from=$social_links item='social_link'}
      <li>
        <a class="bg-white rounded-full h-10 w-10 md:h-14 md:w-14 p-1.5 inline-block flex items-center justify-center" href="{$social_link.url}" target="_blank" rel="noopener noreferrer">
          <img 
            class="h-full w-full object-contain" 
            src="{$urls.img_url}Picto-réseaux-sociaux-mail/{$social_link.label}-bleu.png" 
            alt="Icone {$social_link.label}" title="{$social_link.label}" 
          />
        </a>
      </li>
    {/foreach}
  </ul>
{/block}
