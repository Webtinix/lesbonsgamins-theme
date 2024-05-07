{if isset($is_seven) && $is_seven == true}
  <a 
    id="lnk_evergift" href="{$link->getModuleLink('everpsgift','gifts')|escape:'htmlall':'UTF-8'}" 
    title="{l s='My gifts' mod='everpsgift'}" rel="nofollow"
    class="{if $page.page_name == "module-everpsgift-gifts"} text-lbg-primary bg-white {/if} pl-1 md:pl-4 border-b-2 border-gray-400 md:border-transparent flex items-center menu-client-item justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
    <span class="hidden md:inline text-current">{l s='Mes cartes cadeaux' mod='everpsgift'}</span> 
    <span class="inline md:hidden text-current">{l s='Mes cartes cadeaux à offrir' mod='everpsgift'}</span> 
    <svg class="opacity-100 {if $page.page_name == "module-everpsgift-gifts"} md:opacity-100 {else} md:opacity-0 {/if} group-hover:opacity-100 transition-opacity" xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
      <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961" transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
    </svg>
  </a>
{else}
  <a 
    href="{$link->getModuleLink('everpsgift','gifts')|escape:'htmlall':'UTF-8'}" 
    title="{l s='My GIFT' mod='everpsgift'}"
    class="{if $page.page_name == "module-everpsgift-gifts"} text-lbg-primary bg-white {/if} pl-1 md:pl-4 border-b-2 border-gray-400 md:border-transparent flex items-center menu-client-item justify-between px-4 p-2 w-full cursor-pointer group hover:text-lbg-primary hover:bg-white transition-opacity">
    <span class="hidden md:inline text-current">{l s='Mes cartes cadeaux' mod='everpsgift'}</span> 
    <span class="inline md:hidden text-current">{l s='Mes cartes cadeaux à offrir' mod='everpsgift'}</span> 
    <svg class="opacity-100 {if $page.page_name == "module-everpsgift-gifts"} md:opacity-100 {else} md:opacity-0 {/if} group-hover:opacity-100 transition-opacity" xmlns="http://www.w3.org/2000/svg" width="11.046" height="16.594" viewBox="0 0 11.046 16.594">
      <path id="Tracé_1483" data-name="Tracé 1483" d="M358.409,405.671l7.431,6.409-7.431,5.961" transform="translate(-356.294 -403.555)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
    </svg>
  </a>
{/if}