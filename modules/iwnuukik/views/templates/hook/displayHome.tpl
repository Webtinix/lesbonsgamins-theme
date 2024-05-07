<div class="w-full relative">
	<div class="mx-auto relative md:py-4 px-2 md:px-4" style="max-width: 85rem;">
		<h1 class="font-semibold text-2xl md:text-3xl mb-12 pt-6 lg:mt-0 lg:mb-6 px-2 lg:px-0">
			{l s= 'Des jouets en bois et bien plus encore' mod='iwnuukik'}</h1>
		<div id="displayhome" class="products products-grid w-full">
			{foreach from=$products item="product"}
				{include file='catalog/_partials/miniatures/product.tpl'}

			{/foreach}
		</div>
	</div>
	<div class="absolute bottom-0 bg-lbg-secondary h-40 w-full -z-10"></div>
</div>