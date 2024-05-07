<section class="px-4 lbg-shadow rounded-md mb-5 mt-2 pt-5 w-full">
  <div class="w-full products products-grid grid grid-cols-2 gap-4 lg:grid-cols-4 mt-2">
    {foreach from=$products item="product"}
      {include file='catalog/_partials/miniatures/product.tpl'}
    {/foreach}
  </div>
</section>
