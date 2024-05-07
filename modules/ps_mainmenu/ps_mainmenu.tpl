
{assign var=_counter value=0}
{function name="desktopTopMenu" nodes=[] depth=0 parent=null}
    {if $nodes|count}
      <ul class="flex list-none space-x-5 text-base relative" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
        {foreach from=$nodes item=node}
          {assign var=_counter value=$_counter+1}
          <li class="{if $node.children|count}group{/if} {$node.type}{if $node.current} current {/if}" id="{$node.page_identifier}">
            <div class="flex items-end space-x-1">
              <a 
                href="{$node.url}" data-depth="{$depth}"
                {if $node.open_in_new_window} target="_blank" {/if}
                class="text-sm group-hover:navlink {if $node.page_identifier == "lnk-destockage"}text-red-600 hover:text-red-600{/if} navlink"
              >
                {$node.label}
              </a>
              {if $node.children|count}
              <svg class="mt-2 opacity-0 group-hover:opacity-1 transition-opacity duration-500" xmlns="http://www.w3.org/2000/svg" width="9.359" height="13.048" viewBox="0 0 9.359 13.048">
                <path id="Tracé_1256" data-name="Tracé 1256" d="M0,7.786S2.623,1.832,7.214,0" transform="matrix(0.998, -0.07, 0.07, 0.998, 0.703, 1.197)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-width="1"/>
                <path id="Tracé_1257" data-name="Tracé 1257" d="M0,6.75S2.623,1.588,7.214,0" transform="matrix(0.998, -0.07, 0.07, 0.998, 1.01, 5.597)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-width="1"/>
              </svg>  
              {/if}    
            </div>
            {if $node.children|count}
              {assign var=_expand_id value=10|mt_rand:100000}
              <div class="hidden group-hover:block">
                <div class="absolute left-0 w-full bg-white p-6 shadow-sm">
                  <div class="grid grid-cols-3 gap-8">
                    {assign var="groupSize" value=4}
                    {assign var="groupCount" value=1}
                    {assign var="groupIndex" value=0}
                    {foreach from=$node.children item=child}
                      {if $groupCount == 1}
                        {assign var="group" value=[]}
                      {/if}
                      {if $groupCount <= $groupSize}
                        {assign var="group" value=array_merge($group, [$child])}
                        {assign var="groupCount" value=$groupCount+1}
                      {/if}
                      {if $groupCount > $groupSize || $child@last}
                        {assign var="groupIndex" value=$groupIndex+1}
                        <div class="group-{$groupCount} flex flex-col gap-y-4 {if !$child@last}border-r pr-2{/if}" style="border-color: #CEA0A7;">
                          {foreach from=$group item=item}
                            <div>
                              <a 
                                href="{$item['url']}" data-depth="{$item['depth']}"
                                {if $item['open_in_new_window']} target="_blank" {/if}
                                class="navlink text-sm hover:underline"
                              >
                                {$item['label']}
                              </a>
                            </div>
                          {/foreach}
                        </div>
                        {assign var="groupCount" value=1}
                      {/if}
                    {/foreach}
                  </div>
                </div>
              </div>
            {/if}
          </li>
        {/foreach}
      </ul>
    {/if}
{/function}


{function name="desktopTopMenuSticky" nodes=[] depth=0 parent=null}
  {if $nodes|count}
    <ul class="flex flex-col list-none text-base py-1 bg-[#FAF9F9]" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
      <div class="absolute top-0 left-52 w-full h-full bg-white p-6 shadow-sm"></div>
      {foreach from=$nodes item=node}
        {assign var=_counter value=$_counter+1}
        <li
          class="{if $node.children|count}group{/if} {$node.type}{if $node.current} current {/if}" 
          id="{$node.page_identifier}"
        >
          <div class="flex items-end space-x-1 px-4 py-2">
            <a 
              href="{$node.url}" data-depth="{$depth}"
              {if $node.open_in_new_window} target="_blank" {/if}
              class="text-sm group-hover:navlink {if $node.page_identifier == "lnk-destockage"}text-red-600 hover:text-red-600{/if} navlink"
            >
              {$node.label}
            </a>
            {if $node.children|count}
            <svg class="mt-2 opacity-0 group-hover:opacity-1 transition-opacity duration-500" xmlns="http://www.w3.org/2000/svg" width="9.359" height="13.048" viewBox="0 0 9.359 13.048">
              <path id="Tracé_1256" data-name="Tracé 1256" d="M0,7.786S2.623,1.832,7.214,0" transform="matrix(0.998, -0.07, 0.07, 0.998, 0.703, 1.197)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-width="1"/>
              <path id="Tracé_1257" data-name="Tracé 1257" d="M0,6.75S2.623,1.588,7.214,0" transform="matrix(0.998, -0.07, 0.07, 0.998, 1.01, 5.597)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-width="1"/>
            </svg>  
            {/if}    
          </div>
          {if $node.children|count}
            {assign var=_expand_id value=10|mt_rand:100000}
            <div class="hidden group-hover:block">
              <div class="absolute top-0 left-52 w-full h-full bg-white p-6 shadow-sm">
                <div class="grid grid-cols-3 gap-8">
                  {assign var="groupSize" value=4}
                  {assign var="groupCount" value=1}
                  {assign var="groupIndex" value=0}
                  {foreach from=$node.children item=child}
                    {if $groupCount == 1}
                      {assign var="group" value=[]}
                    {/if}
                    {if $groupCount <= $groupSize}
                      {assign var="group" value=array_merge($group, [$child])}
                      {assign var="groupCount" value=$groupCount+1}
                    {/if}
                    {if $groupCount > $groupSize || $child@last}
                      {assign var="groupIndex" value=$groupIndex+1}
                      <div class="group-{$groupCount} flex flex-col gap-y-4 {if !$child@last}border-r pr-2{/if}" style="border-color: #CEA0A7;">
                        {foreach from=$group item=item}
                          <div>
                            <a 
                              href="{$item['url']}" data-depth="{$item['depth']}"
                              {if $item['open_in_new_window']} target="_blank" {/if}
                              class="navlink text-sm"
                            >
                              {$item['label']}
                            </a>
                          </div>
                        {/foreach}
                      </div>
                      {assign var="groupCount" value=1}
                    {/if}
                  {/foreach}
                </div>
              </div>
            </div>
          {/if}
        </li>
      {/foreach}
    </ul>
  {/if}
{/function}

{assign var=_counter value=0}
{function name="mobileTopMenu" nodes=[] depth=0 parent=null}
  {if $nodes|count}
    <ul class="flex flex-col py-4 space-y-5 relative" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
      {foreach from=$nodes item=node}
        {assign var=_counter value=$_counter+1}
        <li class="flex justify-between items-center" x-data="{ openNavChildren{$_counter}: false }">
          {if $node.children|count}  
            <div @click="openNavChildren{$_counter} = true" class="w-full flex justify-between items-center">
              <span
                class="font-medium text-sm text-gray-800 {if $node.page_identifier == "lnk-destockage"}text-red-600{/if}"
              >
                {$node.label}
              </span>
              <button @click="openNavChildren{$_counter} = true">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 5.242 9.484">
                  <path id="Tracé_1328" data-name="Tracé 1328" d="M178.5-1329l4.035,4.035-4.035,4.035" transform="translate(-177.793 1329.707)" fill="none" stroke="#191310" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/>
                </svg>          
              </button>
            </div>
          {else}
          <a 
            {if $node.open_in_new_window} target="_blank" {/if}
            href={$node.url} 
            class="font-medium text-sm text-gray-800 {if $node.page_identifier == "lnk-destockage"}text-red-600{/if}"
          >
            {$node.label}
          </a>
          {/if}
          {if $node.children|count}
            {assign var=_expand_id value=10|mt_rand:100000}
            <div class="absolute left-0 top-0 bg-white w-full h-full overflow-y-scroll mt-2" x-show="openNavChildren{$_counter}" x-cloak>
              <button @click="openNavChildren{$_counter} = false" class="flex items-center space-x-1" style="color:#00a396;">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 6.369 10.739">
                  <path id="Tracé_1336" data-name="Tracé 1336" d="M178.5-1329l3.955,3.955-3.955,3.955" transform="translate(183.455 -1319.675) rotate(-180)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
                </svg>             
                <span class="text-primary text-base font-medium mt-0.5">{$node.label}</span>        
              </button>
              {mobileTopMenu nodes=$node.children}
            </div>
          {/if}
        </li>
    {/foreach}
    </ul>
  {/if}
{/function}


{* Desktop TopMenu *}
{if $hookName == "displayTop"}
<div id="desktop-top-menu" class="w-full hidden lg:block bg-white">
  <div class="w-full shadow-sm">
    <div class="normalState flex justify-center mx-auto p-4 bg-white" style="max-width: 85rem;">
      {desktopTopMenu nodes=$menu.children}
    </div>
  </div>
  <div
    x-show="openMobileNav" x-cloak
    x-transition:leave="transition ease-in duration-150" 
    x-transition:leave-start="opacity-100" 
    x-transition:leave-end="opacity-0"
    class="stickyState hidden"
  >
    <div 
      class="flex mx-auto px-2 relative" 
      @click.away="openMobileNav = false" 
      style="max-width: 49rem;"
    >
      {desktopTopMenuSticky nodes=$menu.children}
    </div>
  </div>
</div>
{/if}


{* Mobile TopMenu *}
{if $hookName == "displayNav1"}
<div 
  x-show="openMobileNav" x-cloak
  x-transition:leave="transition ease-in duration-150" 
  x-transition:leave-start="opacity-100" 
  x-transition:leave-end="opacity-0" 
  class="w-full h-screen absolute top-0 left-0 lg:hidden" style="background: rgba(0,0,0,0.4);"
>
  <div class="bg-white w-5/6 rounded-r-lg px-4 pt-2 mt-0.5" @click.away="openMobileNav = false">
    <div class="flex items-center justify-end -mx-4 px-2">
      <span @click="openMobileNav = false" aria-hidden="true">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-6 h-6">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" class="text-lbg-primary"></path>
        </svg>
      </span>
    </div>
    <div class="flex items-center justify-between pb-3 pt-2 border-b" style="border-color: #CEA0A7;">
      <a href="/" class="block">
        <img class="h-8 w-40" src="{$urls.img_url}logos/LBG Logo_Ligne_Simple.png" alt="Logo Les Bons Gamins" title="Logo Les Bons Gamins" />
      </a>
      <div class="flex items-center space-x-4">
        <a href="{$link->getModuleLink('blockwishlist', 'lists')|escape:'html':'UTF-8'}" class="relative mr-1">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-8" viewBox="0 0 28.32 39.22">
            <path fill="#00A194" d="M21.95,38.7c-0.2,0-0.39-0.07-0.56-0.2c-0.22-0.19-0.53-0.44-0.92-0.76c-1.64-1.35-4.43-3.65-7.41-6.37  c-1.82,2.44-3.21,4.21-3.7,4.83c-0.3,0.37-0.84,0.44-1.21,0.14c-0.37-0.3-0.44-0.84-0.14-1.21c1.02-1.28,2.32-2.99,3.77-4.94  c-5.29-4.97-10.71-11-11.03-15.23c-0.1-1.28,0.25-2.36,1.03-3.23c0.93-1.03,2.09-1.58,3.45-1.62c3.25-0.09,6.82,2.76,8.57,4.39  c1.34-3.79,4.5-11.45,8.72-13.14c1.3-0.52,2.58-0.45,3.83,0.2c0.77,0.4,1.29,1.11,1.49,2.04c1.09,5.11-7.84,18.35-13.73,26.37  c2.18,2,4.67,4.15,7.47,6.45c0.4,0.33,0.71,0.59,0.94,0.78c0.36,0.31,0.41,0.85,0.1,1.22C22.44,38.6,22.2,38.7,21.95,38.7z   M5.42,11.82c-0.04,0-0.09,0-0.13,0c-0.88,0.03-1.61,0.37-2.22,1.05c-0.46,0.51-0.65,1.14-0.59,1.94c0.22,3.02,3.7,7.69,10.34,13.94  c6.21-8.52,14.2-20.7,13.32-24.82c-0.12-0.56-0.4-0.77-0.6-0.87c-0.79-0.41-1.57-0.45-2.39-0.12c-3.09,1.24-6.12,7.36-7.92,12.67  c-0.15,0.44-0.5,0.76-0.95,0.87c-0.45,0.11-0.92-0.02-1.25-0.35C11.98,15.12,8.35,11.82,5.42,11.82z"/>
          </svg>
          <div class="absolute -bottom-1 left-4 bg-2cb1a5 inline-flex rounded-full h-4 w-4 text-xs justify-center font-medium text-white items-center">
            <span class="text-white" style="font-size: 10px;">{hook h='wx_totalwishlist'}</span>
          </div>
        </a>
        <a href="{$urls.pages.my_account}">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-8" viewBox="0 0 27.57 31.07">
            <g>
              <path fill="#1E1E1C" d="M13.65,28.88c-6.19,0-12.43-3.1-12.43-10.03c0-6.22,5.35-10.92,12.43-10.92c6.25,0,12.71,4.08,12.71,10.92   C26.36,25.74,19.77,28.88,13.65,28.88z M13.65,9.59c-5.23,0-10.78,3.25-10.78,9.26c0,6.18,5.81,8.37,10.78,8.37   c5.5,0,11.06-2.59,11.06-8.37C24.71,13.05,19.08,9.59,13.65,9.59z"/>
              <path fill="#1E1E1C" d="M9.73,18.04c-0.37,0-0.67-0.29-0.68-0.66C9.03,16.69,9.12,16.32,9.19,16c0.07-0.28,0.12-0.52,0.11-1.03   c-0.01-0.37,0.28-0.69,0.66-0.7c0.38,0,0.69,0.29,0.7,0.66c0.02,0.69-0.07,1.05-0.14,1.38c-0.07,0.28-0.12,0.52-0.11,1.03   c0.01,0.37-0.28,0.69-0.66,0.7C9.74,18.04,9.74,18.04,9.73,18.04z"/>
              <path fill="#1E1E1C" d="M16.36,19.43c-0.38,0-0.68-0.3-0.68-0.68c0-0.86-0.02-1.29-0.05-1.72c-0.03-0.45-0.05-0.9-0.05-1.8   c0-0.38,0.3-0.68,0.68-0.68c0.38,0,0.68,0.3,0.68,0.68c0,0.86,0.02,1.29,0.05,1.72c0.03,0.45,0.05,0.9,0.05,1.8   C17.04,19.13,16.74,19.43,16.36,19.43z"/>
              <path fill="#1E1E1C" d="M14.16,25.96c-0.27,0-0.54-0.02-0.81-0.06c-3.61-0.51-5.79-4.23-5.81-4.27c-0.18-0.33-0.06-0.74,0.27-0.92   c0.33-0.18,0.74-0.06,0.92,0.27c0.03,0.05,1.96,3.19,4.83,3.58c1.66,0.22,3.35-0.51,5.03-2.2c0.26-0.27,0.69-0.27,0.96,0   c0.27,0.26,0.27,0.69,0,0.96C17.81,25.07,15.99,25.96,14.16,25.96z"/>
              <path fill="#1E1E1C" d="M5.17,12.38c-0.23,0-0.45-0.13-0.56-0.35c-0.43-0.9-0.7-1.31-0.99-1.74C3.32,9.83,3,9.37,2.53,8.38   C2.39,8.07,2.52,7.7,2.83,7.56C3.14,7.41,3.5,7.54,3.65,7.85c0.43,0.91,0.7,1.31,0.99,1.75c0.3,0.45,0.62,0.92,1.09,1.9   c0.15,0.31,0.01,0.68-0.29,0.82C5.35,12.36,5.26,12.38,5.17,12.38z"/>
              <path fill="#1E1E1C" d="M12.53,8.28c-0.02,0-0.03,0-0.05,0c-0.34-0.03-0.59-0.33-0.56-0.67c0.1-1.23,0.15-1.84,0.21-2.45   c0.05-0.6,0.11-1.2,0.21-2.39C12.36,2.43,12.67,2.17,13,2.2c0.34,0.03,0.59,0.33,0.56,0.67c-0.1,1.2-0.15,1.8-0.21,2.4   c-0.06,0.61-0.11,1.22-0.21,2.44C13.12,8.04,12.85,8.28,12.53,8.28z"/>
              <path fill="#1E1E1C" d="M21.17,10.9c-0.13,0-0.26-0.04-0.36-0.13c-0.23-0.2-0.26-0.55-0.06-0.78c0.8-0.93,1.2-1.39,1.61-1.86   c0.4-0.46,0.81-0.92,1.6-1.85c0.2-0.23,0.55-0.26,0.78-0.06c0.23,0.2,0.26,0.55,0.06,0.78C24,7.94,23.6,8.4,23.19,8.86   c-0.4,0.46-0.81,0.92-1.6,1.85C21.48,10.84,21.33,10.9,21.17,10.9z"/>
              <path fill="#1E1E1C" d="M18.19,9.5c-0.06,0-0.13-0.01-0.19-0.03c-0.33-0.1-0.5-0.45-0.4-0.78c0.26-0.82,0.32-1.25,0.37-1.7   C18.03,6.5,18.09,6,18.39,5.06c0.1-0.32,0.45-0.5,0.78-0.4c0.33,0.1,0.5,0.45,0.4,0.78c-0.26,0.82-0.32,1.25-0.37,1.7   c-0.06,0.49-0.12,0.99-0.42,1.93C18.69,9.33,18.45,9.5,18.19,9.5z"/>
              <path fill="#1E1E1C" d="M8.92,9.28c-0.28,0-0.53-0.19-0.6-0.47c-0.16-0.65-0.26-0.98-0.35-1.3c-0.1-0.33-0.2-0.67-0.37-1.34   C7.52,5.83,7.72,5.5,8.05,5.42C8.38,5.33,8.72,5.53,8.8,5.86c0.16,0.65,0.26,0.97,0.35,1.29c0.1,0.34,0.2,0.67,0.37,1.35   C9.6,8.84,9.4,9.17,9.07,9.26C9.02,9.27,8.97,9.28,8.92,9.28z"/>
            </g>
          </svg>
        </a>
      </div>
    </div>
    <div class="pt-2">
      {mobileTopMenu nodes=$menu.children}
    </div>
    <div class="flex items-stretch justify-between space-x-2 items-center pt-4 pb-8">
      {* {$urls|dump} *}
      <a href="{$urls.base_url}nous-contacter" class="text-primary text-xs font-medium text-base text-green-700">Aide et contact</a>
      <a href="{$urls.base_url}suivi-commande-invite" class="text-primary text-xs font-medium text-base text-green-700">Suivre mon colis</a>
      <a href="{$urls.base_url}blog/" class="text-primary text-xs font-medium text-base text-green-700">Blog</a>
    </div>
  </div>
</div>
{/if}
