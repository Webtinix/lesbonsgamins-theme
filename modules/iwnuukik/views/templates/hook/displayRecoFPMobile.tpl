<section class="my-8">
	<div class="px-2 section-head lbg-text-dark">
		<h4 class="my-0">{l s='Vous pourriez aimer' mod='iwnuukik'}</h4>
	</div>
	<div class="w-full p-2 overflow-x-auto lbg-scrollbar reco-fp-mobile">
		<div class="px-4 -mt-2 lbg-shadow rounded-md" style="width:850px;">
			<div class="row products products-grid mt-6 pt-3 grid grid-cols-4">
				{foreach from=$products item="product" key="position"}
					{if $position < 4}
					{include file='catalog/_partials/miniatures/product.tpl'}
					{/if}
				{/foreach}
			</div>
		</div>
	</div>
	<style>
		.reco-fp-mobile .product {
			width: 100%;
			margin-bottom: 10px;
		}
	</style>
</section> 
