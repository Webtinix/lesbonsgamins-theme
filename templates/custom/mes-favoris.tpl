{extends file='customer/page.tpl'}

{* {block name='page_title'}
<div class="flex space-x-2 mb-4 items-center">
    <div class="border rounded-full p-5">
        <i class="material-icons text-4xl">favorite_border</i>
    </div>
    <div class="">
        <p class="my-0 text-xl md:text-3xl">{l s='Mes favoris' d='Shop.Theme.Customeraccount'}</p>
        <p class="my-1">{l s='Ma liste de favoris.' d='Shop.Theme.Customeraccount'}</p>
    </div>
</div>
{/block} *}

{block name='page_content'}
    <div class="w-full relative md:py-5 px-4 mx-auto" style="max-width: 85rem;">
        <h2 class="font-medium text-[1.7rem] py-4 lg:px-0 border-b-2 border-gray-400">{l s= 'Mes produits favoris' d='Shop.Theme.Checkout'}</h2>
        <div class="products products-grid w-full grid grid-cols-2 md:grid-cols-4 gap-2 md:gap-4">
            {assign var="wishlish_products" value=$favorisController->getMyWishlist()}
            {if not empty($wishlish_products) }
                {foreach from=$wishlish_products item="product" key="position"}
                    {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position productClasses="favoris col-xs-6 col-xl-3"}
                {/foreach}
            {else}
                <p>Vous n'avez aucun favori</p>
            {/if}
        </div>
    </div>
{/block}