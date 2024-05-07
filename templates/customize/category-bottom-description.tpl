
{if $category && $category['level_depth'] === "3"}
<div class="relative w-full py-14">
    <p class="text-xl px-4 mb-8 md:hidden">
    {assign var="banner_titre" value=$wx_customshop->getAdministrationClass("BannerAnyWhereAdministration")->generateBanner(19)}
    {$banner_titre nofilter}
    </p>
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
            <img alt="Carte Cadeaux - Plan de travail" title="Carte Cadeaux - Plan de travail" class="w-full h-full object-cover" src="{$urls.img_url}LBG - Carte cadeaux_Plan de travail 1-min.png" />
        </div>
    </div>
</div>
{/if}

{assign var='descriptionSeo' value=$wx_customshop->get_acf_value('description_seo', $category.id)}
{if $descriptionSeo|strlen > 0}
<div x-data="{ expanded: false }" :class="expanded ? 'page-content page-cms' : ''" class="bg-white w-full py-10 md:py-16 mx-auto px-4" style="max-width: 85rem;">
    <h2 class="font-bold text-[1.7rem] mb-6">Categorie : {$category.name}</h2>
    <div x-show="expanded" x-cloak>
        <p class="text-sm">{$descriptionSeo nofilter}</p>
    </div>
    <div x-show="!expanded" x-cloak>
        <p class="text-sm">{$descriptionSeo|truncate:400:'...' nofilter}</p>
    </div>
    {if !($descriptionSeo|strlen <= 400)}
    <button @click="expanded = !expanded" class=" text-sm">
        <span x-show="!expanded" x-cloak class="underline text-lbg-primary">Voir plus</span>
        <span x-show="expanded" x-cloak class="underline text-lbg-primary">Voir moins</span>
    </button>
    {/if}
</div>
{/if}