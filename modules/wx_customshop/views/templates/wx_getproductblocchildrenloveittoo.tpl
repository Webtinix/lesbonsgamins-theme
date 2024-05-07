<div class="w-full relative mt-8 md:mt-0">
	<div class="mx-auto relative py-7 md:pt-5 md:pb-0 px-2 md:px-4" style="max-width: 85rem;">
		<h2 class="font-semibold text-2xl md:text-3xl mb-12 lg:mt-6 px-2 lg:px-0">
			{l s= 'Les enfants adorent aussi' mod='iwnuukik'}
		</h2>
		<div id="displayhome_children" class="products w-full pt-5 md:pt-2">
			{foreach from=$products item="product"}
				{include file='catalog/_partials/miniatures/product.tpl'}
			{/foreach}
		</div>
	</div>
	<div class="absolute bottom-0 bg-lbg-secondary h-40 w-full -z-10"></div>
</div>