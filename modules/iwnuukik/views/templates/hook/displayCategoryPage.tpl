<div class="w-full relative">
	<div class="mx-auto relative md:py-5 px-2 md:px-4" style="max-width: 85rem;">
		<p class="text-sm px-2 lg:px-0">{$wx_customshop->getTotalProductsInCategory($category['id'])} produits trouvés</p>
		{* <h2 class="font-medium text-[1.7rem]  mb-12 lg:mb-6 px-2 lg:px-0"> *}
		<h2 class="font-semibold text-2xl md:text-3xl mb-12 lg:my-6 px-2 lg:px-0">{l s= 'Les jouets et jeux en bois coup de cœur des enfants' mod='iwnuukik'}</h2>
		<div id="displayCategory" class="products products-grid w-full grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-2 md:gap-4">
			{foreach from=$products item="product" key="index" name="limited_products"}
				{if $index < 8}
					{include file='catalog/_partials/miniatures/product.tpl'}
				{/if}
			{/foreach}
		</div>
	</div>
	<div class="absolute bottom-0 bg-lbg-secondary h-24 w-full -z-10"></div>
</div>