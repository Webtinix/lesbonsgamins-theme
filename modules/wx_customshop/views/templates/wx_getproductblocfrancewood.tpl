{* <div class="w-full relative mt-8 md:mt-0 border-b-2 md:border-none pb-4 md:pb-0"> *}
<div class="w-full relative mt-8 md:mt-12 lg:mt-16 border-b-2 md:border-none pb-4 md:pb-0">
	<div class="mx-auto relative md:py-5 px-2 md:px-4" style="max-width: 85rem;">
		<h2 class="font-semibold text-2xl md:text-3xl mb-12 lg:mt-6 px-2 lg:px-0">
			{if isset($category)}
				{l 
					s='%categoryName% : Notre sélection Made in France'
					d='Shop.Theme.Checkout'
					sprintf=[
						'%categoryName%' => $category.name
					]
				}
			{else}
				{l s= 'Des jouets bébés fabriqués en France' d='Shop.Theme.Checkout'}
			{/if}
		</h2>
		<div id="displayhome_children_wood" class="products w-full pt-5 md:pt-2">
			{foreach from=$products item="product"}
				{include file='catalog/_partials/miniatures/product.tpl'}
			{/foreach}
		</div>
	</div>
</div>