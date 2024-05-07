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

{function renderDropdown}
  {if $logged}
    <div
      class="-right-1 top-12 absolute opacity-0 inivisible hidden group-hover:block group-hover:opacity-1 z-10 py-2 px-5 text-gray-500 transition-opacity duration-300 rounded shadow-md bg-fff3e8">
      {* <div class="flex flex-col space-y-1 items-center"> *}
      <div class="hidden md:block flex flex-col space-y-1 items-center text-center">
        <a href="{$urls.pages.identity}"
          class="rounded  bg-lbg-primary  hover:bg-primary  text-white font-medium py-2 px-5 text-xs whitespace-nowrap"
          style="/*background-color: #2cb1a5;*/">Espace client</a>
        <a href="{$urls.pages.identity}" class="underline text-xs  whitespace-nowrap" title="{$customerName}">
          {$customerName|truncate:30:'...'}
        </a>
      </div>
      {* pour mobile *}
      <div class="md:hidden flex flex-col space-y-1 items-center text-center">
        <a href="{$urls.pages.my_account}"
          class="rounded  bg-lbg-primary  hover:bg-primary  text-white font-medium py-2 px-5 text-xs whitespace-nowrap"
          style="/*background-color: #2cb1a5;*/">Espace client</a>
        <a href="{$urls.pages.my_account}" class="underline text-xs  whitespace-nowrap" title="{$customerName}">
          {$customerName|truncate:30:'...'}
        </a>
      </div>
      <div class="arrow ::before, ::after"></div>
    </div>
  {else}
    <div
      class="-right-1 top-12 absolute opacity-0 inivisible hidden group-hover:block group-hover:opacity-1 z-10 py-2 px-5 text-gray-500 transition-opacity duration-300 rounded shadow-md bg-fff3e8">
      <div class="flex flex-col space-y-1 items-center">
        <a href="{$urls.pages.identity}"
          class="rounded text-white  bg-lbg-primary  hover:bg-primary font-medium py-2 px-5 text-xs whitespace-nowrap"
          style="/*background-color: #2cb1a5;*/">S'identifier</a>
        <a href="{$urls.pages.identity}" class="underline text-xs whitespace-nowrap">Crée un compte</a>
      </div>
      <div class="arrow ::before, ::after"></div>
    </div>
  {/if}
{/function}

{function renderAccountIcon}
  <svg class="client-icon h-7 md:h-8" version="1.1" id="Calque_1" xmlns="http://www.w3.org/2000/svg"
    xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 27.57 31.07"
    style="enable-background:new 0 0 27.57 31.07;" xml:space="preserve">
    <style type="text/css">
      {if $logged}
        {literal}
          .st0{fill:#00A194;}
        {/literal}
      {else}
        {literal}
          .st0{fill:#1E1E1C;}
        {/literal}
      {/if}

      {literal}
        .client-icon:hover .st0{fill:#00A194;}
      {/literal}
    </style>
    <g>
      <path class="st0" d="M13.65,28.88c-6.19,0-12.43-3.1-12.43-10.03c0-6.22,5.35-10.92,12.43-10.92c6.25,0,12.71,4.08,12.71,10.92
      C26.36,25.74,19.77,28.88,13.65,28.88z M13.65,9.59c-5.23,0-10.78,3.25-10.78,9.26c0,6.18,5.81,8.37,10.78,8.37
      c5.5,0,11.06-2.59,11.06-8.37C24.71,13.05,19.08,9.59,13.65,9.59z" />
      <path class="st0" d="M9.73,18.04c-0.37,0-0.67-0.29-0.68-0.66C9.03,16.69,9.12,16.32,9.19,16c0.07-0.28,0.12-0.52,0.11-1.03
      c-0.01-0.37,0.28-0.69,0.66-0.7c0.38,0,0.69,0.29,0.7,0.66c0.02,0.69-0.07,1.05-0.14,1.38c-0.07,0.28-0.12,0.52-0.11,1.03
      c0.01,0.37-0.28,0.69-0.66,0.7C9.74,18.04,9.74,18.04,9.73,18.04z" />
      <path class="st0" d="M16.36,19.43c-0.38,0-0.68-0.3-0.68-0.68c0-0.86-0.02-1.29-0.05-1.72c-0.03-0.45-0.05-0.9-0.05-1.8
      c0-0.38,0.3-0.68,0.68-0.68c0.38,0,0.68,0.3,0.68,0.68c0,0.86,0.02,1.29,0.05,1.72c0.03,0.45,0.05,0.9,0.05,1.8
      C17.04,19.13,16.74,19.43,16.36,19.43z" />
      <path class="st0" d="M14.16,25.96c-0.27,0-0.54-0.02-0.81-0.06c-3.61-0.51-5.79-4.23-5.81-4.27c-0.18-0.33-0.06-0.74,0.27-0.92
      c0.33-0.18,0.74-0.06,0.92,0.27c0.03,0.05,1.96,3.19,4.83,3.58c1.66,0.22,3.35-0.51,5.03-2.2c0.26-0.27,0.69-0.27,0.96,0
      c0.27,0.26,0.27,0.69,0,0.96C17.81,25.07,15.99,25.96,14.16,25.96z" />
      <path class="st0" d="M5.17,12.38c-0.23,0-0.45-0.13-0.56-0.35c-0.43-0.9-0.7-1.31-0.99-1.74C3.32,9.83,3,9.37,2.53,8.38
      C2.39,8.07,2.52,7.7,2.83,7.56C3.14,7.41,3.5,7.54,3.65,7.85c0.43,0.91,0.7,1.31,0.99,1.75c0.3,0.45,0.62,0.92,1.09,1.9
      c0.15,0.31,0.01,0.68-0.29,0.82C5.35,12.36,5.26,12.38,5.17,12.38z" />
      <path class="st0" d="M12.53,8.28c-0.02,0-0.03,0-0.05,0c-0.34-0.03-0.59-0.33-0.56-0.67c0.1-1.23,0.15-1.84,0.21-2.45
      c0.05-0.6,0.11-1.2,0.21-2.39C12.36,2.43,12.67,2.17,13,2.2c0.34,0.03,0.59,0.33,0.56,0.67c-0.1,1.2-0.15,1.8-0.21,2.4
      c-0.06,0.61-0.11,1.22-0.21,2.44C13.12,8.04,12.85,8.28,12.53,8.28z" />
      <path class="st0" d="M21.17,10.9c-0.13,0-0.26-0.04-0.36-0.13c-0.23-0.2-0.26-0.55-0.06-0.78c0.8-0.93,1.2-1.39,1.61-1.86
      c0.4-0.46,0.81-0.92,1.6-1.85c0.2-0.23,0.55-0.26,0.78-0.06c0.23,0.2,0.26,0.55,0.06,0.78C24,7.94,23.6,8.4,23.19,8.86
      c-0.4,0.46-0.81,0.92-1.6,1.85C21.48,10.84,21.33,10.9,21.17,10.9z" />
      <path class="st0" d="M18.19,9.5c-0.06,0-0.13-0.01-0.19-0.03c-0.33-0.1-0.5-0.45-0.4-0.78c0.26-0.82,0.32-1.25,0.37-1.7
      C18.03,6.5,18.09,6,18.39,5.06c0.1-0.32,0.45-0.5,0.78-0.4c0.33,0.1,0.5,0.45,0.4,0.78c-0.26,0.82-0.32,1.25-0.37,1.7
      c-0.06,0.49-0.12,0.99-0.42,1.93C18.69,9.33,18.45,9.5,18.19,9.5z" />
      <path class="st0" d="M8.92,9.28c-0.28,0-0.53-0.19-0.6-0.47c-0.16-0.65-0.26-0.98-0.35-1.3c-0.1-0.33-0.2-0.67-0.37-1.34
      C7.52,5.83,7.72,5.5,8.05,5.42C8.38,5.33,8.72,5.53,8.8,5.86c0.16,0.65,0.26,0.97,0.35,1.29c0.1,0.34,0.2,0.67,0.37,1.35
      C9.6,8.84,9.4,9.17,9.07,9.26C9.02,9.27,8.97,9.28,8.92,9.28z" />
    </g>
  </svg>
{/function}

<div class="hidden md:block group mt-2">
  <a class="flex items-center justify-center" href="{$urls.pages.identity}" style="width: 32px; height: 40px">
    {renderAccountIcon}
  </a>
  {renderDropdown}
</div>

<div class="md:hidden group mt-2">
  <a class="flex items-center justify-center" href="{$urls.pages.my_account}" style="width: 32px; height: 40px">
    {renderAccountIcon}
  </a>
  {renderDropdown}
</div>