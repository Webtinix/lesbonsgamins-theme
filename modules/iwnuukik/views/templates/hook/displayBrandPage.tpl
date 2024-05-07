{assign var='id_manufacturer' value=$smarty.get['id_manufacturer']}

{if count($products) >= 1}
<div class="w-full relative">
	<div class="mx-auto relative md:py-5 px-2 md:px-4" style="max-width: 85rem;">
		<h2 class="font-bold text-[1.7rem] mb-12 lg:mb-6 px-2 lg:px-0">
			{l s='Les meilleurs vente %manufacturer%' d='Shop.Theme.Catalog' sprintf=[
				'%manufacturer%' => Manufacturer::getNameById((int) $id_manufacturer)
			]}
		</h2>
		<div id="displayhome" class="products products-grid w-full">
			{foreach from=$products item="product" key="index" name="limited_products"}
				{if $product.id_manufacturer == $id_manufacturer}
					{include file='catalog/_partials/miniatures/product.tpl'}
				{/if}
			{/foreach}
		</div>
	</div>
</div>
{/if}