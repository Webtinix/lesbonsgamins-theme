{*
 * This file allows you to customize your search page.
 * You can safely remove it if you want it to appear exactly like all other product listing pages
 *}
{extends file='catalog/listing/product-list.tpl'}

{block name="error_content"}
  <div style="max-width: 85rem;" class="mx-auto p-4">
    <p>{l s='No matches were found for your search' d='Shop.Theme.Catalog'}</p>
    <p>{l s='Please try other keywords to describe what you are looking for.' d='Shop.Theme.Catalog'}</p>
  </div>
{/block}

{block name='product_list'}
  {include file='catalog/_partials/products.tpl' listing=$listing productClass="col-xs-6 col-xl-3"}
{/block}
