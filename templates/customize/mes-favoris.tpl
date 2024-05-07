{extends file='customer/page.tpl'}

{block name='page_title'}
<div class="flex space-x-2 mb-4 items-center">
    <div class="border rounded-full p-5">
        <i class="material-icons text-4xl">favorite_border</i>
    </div>
    <div class="">
        <p class="my-0 text-xl md:text-3xl">{l s='Mes favoris' d='Shop.Theme.Customeraccount'}</p>
        <p class="my-1">{l s='Ma liste de favoris.' d='Shop.Theme.Customeraccount'}</p>
    </div>
</div>
{/block}

{block name='page_content'}
    <div class="px-4 pt-4 border rounded">
        <div class="row">
            {assign var="wishlish_products" value=$favorisController->getMyWishlist()}
            {if not empty($wishlish_products) }
            <div class="products">
                {foreach from=$wishlish_products item="product" key="position"}
                {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position productClasses="favoris col-xs-6 col-xl-3"}
                {/foreach}
            </div>
            {else}
            <p>Vous n'avez aucun favori</p>
            {/if}
        </div>
    </div>
{/block}