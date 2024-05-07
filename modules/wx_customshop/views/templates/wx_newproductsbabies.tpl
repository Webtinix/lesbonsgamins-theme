<div class="w-full relative mt-8 md:mt-0">
	<div class="mx-auto relative md:py-5 px-2 md:px-4" style="max-width: 85rem;">
		<h2 class="font-semibold text-2xl md:text-3xl mb-12 lg:my-6 px-2 lg:px-0">
			{if isset($category)}
				{l 
					s='%categoryName% : Les nouveautés'
					d='Shop.Theme.Checkout'
					sprintf=[
						'%categoryName%' => $category.name
					]
				}
			{else}
				{l s= 'Les nouveautés pour bébé' mod='iwnuukik'}
			{/if}
		</h2>
		<div id="displayhome_children" class="products w-full pt-5 md:pt-2">
			{foreach from=$products item="product"}
				{include file='catalog/_partials/miniatures/product.tpl'}
			{/foreach}
		</div>
	</div>
	<div class="absolute bottom-0  h-24 w-full -z-10"></div>
</div>
