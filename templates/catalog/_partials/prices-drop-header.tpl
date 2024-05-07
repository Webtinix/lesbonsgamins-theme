{if isset($prices_drop)}
    {assign var="n1_categories" value=$wx_customshop->wx_getCategoryInformation( $prices_drop['n1_categories'] )}
    {assign var="categories" value=$wx_customshop->wx_getCategoryInformation( $prices_drop['categories'] )}
    {assign var="subcategories" value=$prices_drop['subcategories']}

    <div id="js-product-list-header">
        <div class="w-full h-60 md:h-96">
            <img 
                class="h-full w-full object-cover" 
                src="{$urls.img_url}/destockage.jpg" 
                alt="Categorie Destockage" 
                title="Categorie Destockage" 
                loading="lazy" 
            />
        </div>
        <div class="mx-auto px-4 -mt-12 md:-mt-20 z-10 relative" style="max-width: 85rem;">
            <div class="bg-lbg-secondary rounded-md md:shadow-sm w-full py-6 md:py-16 px-4 md:px-12">
                <h1 class="font-medium text-xl md:text-2xl mb-6 font-bold">{l s='Destockage' d='Shop.Theme.Global'}</h1>
                <p id="category-description" class="text-sm">{l s='Description category destockage' d='Shop.Theme.Global'}</p>
            </div>
        </div>
    </div>

    {if !empty($n1_categories) && count($n1_categories) > 1}
    <div class="mx-auto px-4 mt-8 mb-8 {if $n1_categories|count <= 4}md:-mb-8{else}md:mb-0{/if}" style="max-width: 85rem;">
      <ul id="subcategories" class="w-full relative">
        {foreach from=$n1_categories item=category}
            {if $category['active']}
            <li class="mt-3 md:mt-3 z-1 flex p-1 md:p-0 border border-lbg-primary md:border-gray-300 h-20 md:h-28 bg-white rounded-md overflow-hidden">
                <div class="w-20 md:w-40 h-full overflow-hidden">
                    <a href="{$link->getPageLink('prices-drop', true, 1)}?category={$category['id_category']}" title="{$category.name|escape:'html':'UTF-8'}" class="h-full w-full">
                        {if !empty($link->getCatImageLink($category["link_rewrite"],$category["id_category"]))}
                        <img 
                            class="h-full w-full object-cover transform transition duration-500 hover:scale-125" 
                            src="{$link->getCatImageLink($category["link_rewrite"],$category["id_category"])}" 
                            alt="{$category["name"]|escape:'html':'UTF-8'}" 
                            title="{$category["name"]|escape:'html':'UTF-8'}" 
                            loading="lazy"
                            width="141" height="180"
                        />
                        {/if}
                    </a>
                </div>
                <div class="flex-1 flex items-center p-3">
                    <h3 class="text-sm font-medium text-lbg-primary">
                        <a class="" href="{$link->getPageLink('prices-drop', true, 1)}?category={$category['id_category']}">{$category.name|escape:'html':'UTF-8'}</a>
                    </h3>
                </div>
            </li>
            {/if}
        {/foreach}
      </ul>
    </div>
    {if $n1_categories|count <= 4}
    <style>
        @media (min-width: 768px) { 
          #subcategories .owl-stage-outer {
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: visible;
          }
        }
      </style>
    {/if}
    {elseif !empty($subcategories) && count($subcategories) > 1}
    <div class="mx-auto px-4 mt-8 mb-8 {if $subcategories|count <= 4}md:-mb-8{else}md:mb-0{/if}" style="max-width: 85rem;">
      <ul id="subcategories" class="w-full relative">
        {foreach from=$subcategories item=subcategory}
            {if $subcategory['active']}
            <li class="mt-3 md:mt-3 z-1 flex p-1 md:p-0 border border-lbg-primary md:border-gray-300 h-20 md:h-28 bg-white rounded-md overflow-hidden">
                <div class="w-20 md:w-40 h-full overflow-hidden">
                    <a href="{$link->getPageLink('prices-drop', true, 1)}?category={$subcategory['id_category']}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="h-full w-full">
                        {if !empty($link->getCatImageLink($subcategory["link_rewrite"],$subcategory["id_category"]))}
                        <img class="h-full w-full object-cover transform transition duration-500 hover:scale-125" 
                            src="{$link->getCatImageLink($subcategory["link_rewrite"],$subcategory["id_category"])}" 
                            alt="{$subcategory["name"]|escape:'html':'UTF-8'}" 
                            title="{$subcategory["name"]|escape:'html':'UTF-8'}" 
                            loading="lazy"
                            width="141" height="180"
                        />
                        {/if}
                    </a>
                </div>
                <div class="flex-1 flex items-center p-3">
                    <h3 class="text-sm font-medium text-lbg-primary">
                        <a class="" href="{$link->getPageLink('prices-drop', true, 1)}?category={$subcategory['id_category']}">{$subcategory.name|escape:'html':'UTF-8'}</a>
                    </h3>
                </div>
            </li>
            {/if}
        {/foreach}
      </ul>
    </div>
    {if $subcategories|count <= 4}
    <style>
        #subcategories .owl-stage-outer {
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: visible;
        }
    </style>
    {/if}
    {/if}
{/if}