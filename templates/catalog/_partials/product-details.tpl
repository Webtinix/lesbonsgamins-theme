<div class="" id="product-details" data-product="{$product.embedded_attributes|json_encode}" role="tabpanel">
  <ul class="flex flex-col gap-5 text-[.9rem]">
    {if $product.id_manufacturer && Manufacturer::getNameById((int) $product.id_manufacturer)}
    <li>
      <span class="">Marque :</span>
        <a href="{$link->getmanufacturerLink($product.id_manufacturer)}" class="text-base font-medium">
          {Manufacturer::getNameById((int) $product.id_manufacturer)}
        </a>
    </li>
    {/if}
    {* <li>Âge : A partir de 3 mois</li> *}
    {* <li>Largeur (cm) : 7.5</li>
      <li>Hauteur (cm) : 7.5</li> *}
    {block name='product_features'}
      {if $product.grouped_features}
        {* <section class="product-features mx-0"> *}
        {* <p class="h6">{l s='Data sheet' d='Shop.Theme.Catalog'}</p> *}
        {* <dl class="data-sheet"> *}
        {foreach from=$product.grouped_features item=feature}
          <li>
            <span class="">{$feature.name} :</span>
            {$feature.value|escape:'htmlall'|nl2br nofilter} {if $feature.name == "Dimensions"}cm{/if}
          </li>
          {* <dt class="name">{$feature.name}</dt> *}
          {* <dd class="value">
                  {$feature.value|escape:'htmlall'|nl2br nofilter}
                  {if $feature.name == "Dimensions"}cm{/if}
                </dd> *}
        {/foreach}
        {* </dl> *}
        {* </section> *}
      {/if}
    {/block}
    {assign var="made_in_france" value=$wx_customshop->get_acf_value('MADE_IN_FRANCE', $product.id_product)}
    <li>
      <span class="">
        Fabriqué en France :
      </span>
      {if $made_in_france == 1} oui {else} non {/if}
    </li>
    <li>
      {block name='product_reference'}
        {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
          {* <div class="product-reference"> *}
          {* <label class="label">{l s='Reference :' d='Shop.Theme.Catalog'} </label> *}
          <span class="">{l s='Reference :' d='Shop.Theme.Catalog'}</span> {$product.reference_to_display}
          {* </div> *}
        {/if}
      {/block}
    </li>
  </ul>
  {* 
    {block name='product_features'}

      {if $product.grouped_features}
            <section class="product-features mx-0">
              <p class="h6">
        {l s='Data sheet' d='Shop.Theme.Catalog'}</p>
              <dl class="data-sheet">

        {foreach from=$product.grouped_features item=feature}
                    <dt class="name">{$feature.name}</dt>
                    <dd class="value">
                      {$feature.value|escape:'htmlall'|nl2br nofilter}

          {if $feature.name == "Dimensions"}cm
          {/if}
                    </dd>

        {/foreach}
              </dl>
            </section>

      {/if}

    {/block} *}

    {* if product have specific references, a table will be added to product details section *}
    {* {block name='product_specific_references'}

      {if !empty($product.specific_references)}
            <section class="product-features mx-0">
              <p class="h6">
        {l s='Specific References' d='Shop.Theme.Catalog'}</p>
                <dl class="data-sheet">

        {foreach from=$product.specific_references item=reference key=key}
                      <dt class="name">{$key}</dt>
                      <dd class="value">{$reference}</dd>

        {/foreach}
                </dl>
            </section>

      {/if}

    {/block}


    {block name='product_condition'}

      {if $product.condition}
            <div class="product-condition">
              <label class="label">
        {l s='Condition' d='Shop.Theme.Catalog'} </label>
              <link href="{$product.condition.schema_url}"/>
              <span>{$product.condition.label}</span>
            </div>

      {/if}

    {/block} *}
  </div>