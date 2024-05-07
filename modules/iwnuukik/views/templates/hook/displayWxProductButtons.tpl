{* <section class="px-4 lbg-shadow rounded-md my-8 pt-8 hidden lg:block">
	<div class="section-head px-6 md:px-0 mx-auto lbg-text-dark">
		<h4 class="mt-0">{l s='Vous aimeriez aussi peut-être :' mod='iwnuukik'}</h4>
	</div>
	<div class="row products products-grid mt-6">
		{foreach from=$products item="product" key="position"}
			{if $position < 4}
    		{include file='catalog/_partials/miniatures/product.tpl'}
			{/if}
		{/foreach}
	</div>
</section> *}

<div class="w-full relative">
	<div class="mx-auto relative md:py-5 px-2 md:px-5" style="max-width: 85rem;">
		<h2 class="font-medium text-[1.7rem] mb-6 px-2 lg:px-0"><span class="font-bold">{l s='Les enfants adorent aussi' mod='iwnuukik'}</span></h2>
		<div id="displayProductReco" class="products products-grid w-full">
			{foreach from=$products item="product" key="index" name="limited_products"}
				{include file='catalog/_partials/miniatures/product.tpl'}
			{/foreach}
		</div>
	</div>
</div>

