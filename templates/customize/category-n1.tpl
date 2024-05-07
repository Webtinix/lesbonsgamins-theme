<div class="w-full relative mb-6 hidden md:block">
    <div class="grid grid-cols-2 gap-3">
        <div class="w-full relative">
            {hook h='displayBanner'}
        </div>
        <div class="w-full relative">
            {hook h='displayCreativeSlider'}
        </div>
    </div>
    <div 
        class="absolute inset-0 mx-auto grid place-items-center w-48 h-48 z-50 bg-white rounded-full flex items-center justify-center p-4"
        style="top: 50%;transform: translateY(-50%)"
    >
        {assign var='h_1' value=$wx_customshop->get_acf_value('h_1', $category.id)}
        <h1 class="text-2xl font-medium text-center">{$h_1}</h1>
    </div>
</div>

<div class="w-full relative mb-6 md:hidden">
    <div class="h-72">
        <img 
            alt="Cover {$category.name}"
            {if $category.image["medium"]["url"]}
            src="{$category.image["medium"]["url"]}"
            {else}
            src="{$urls.img_url}lbg-category-img-1.png"
            {/if}
            class="w-full h-full object-cover"
        />
    </div>
</div>

{block name='subcategory_list'}
    {if isset($subcategories) && $subcategories|@count > 0}
        {include file='catalog/_partials/subcategories.tpl' subcategories=$subcategories}
    {/if}
{/block}

{hook h='displayCategoryPage'}

<div class="relative w-full bg-lbg-secondary py-20">
    <h2 class="text-xl px-4 mb-8 md:hidden">
        {assign var="banner_titre" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(19)}
        {$banner_titre nofilter}
    </h2>
    <div class="flex flex-col-reverse md:flex-row items-center px-4 gap-8 md:gap-12 mx-auto" style="max-width: 85rem;">
        <div class="w-full w-mid">
            <h2 class="font-bold text-[1.7rem] mb-8 hidden md:block">
                {assign var="banner_titre" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(19)}
                {$banner_titre nofilter}
            </h2>
            {assign var="banner_paragraph" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(20)}
            {$banner_paragraph nofilter}
        </div>
        <div class="w-full w-card h-72 md:h-80 overflow-hidden rounded-xl md:rounded-md">
            <img class="w-full h-full object-cover" src="{$urls.img_url}LBG - Carte cadeaux_Plan de travail 1-min.png" />
        </div>
    </div>
</div>

{* add by Orphée Lié  Nuukik reco zone factice *}
    {hook h='Wx_newProductsBabies'}
    {hook h='Wx_getProductBlocFranceWood'}
{* end reco *}

{* {include file="customize/category-bottom-description.tpl" category=$category} *}
