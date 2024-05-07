{extends file='customer/_partials/address-form.tpl'}

{block name='form_field'}
  {if $field.name eq "alias" and $customer.is_guest}
    {* we don't ask for alias here if customer is not registered *}
  {else}
    {$smarty.block.parent}
  {/if}
{/block}

{block name="address_form_url"}
  <form
    method="POST"
    action="{url entity='order' params=['id_address' => $id_address]}"
    data-id-address="{$id_address}"
    data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'addressForm']}"
  >
{/block}

{block name='form_fields' append}
  <input type="hidden" name="saveAddress" value="{$type}">
  {if $type === "delivery"}
    <div class="w-full">
    {* <div class="col-span-12"> *}
      <div class="w-full">
        <input name = "use_same_address" id="use_same_address" type = "checkbox" value = "1" {if $use_same_address} checked {/if}>
        <label for="use_same_address">{l s='Use this address for invoice too' d='Shop.Theme.Checkout'}</label>
      </div>
    </div>
  {/if}
{/block}

{block name='form_buttons'}
  {if !$form_has_continue_button}
    <button type="submit" class="btn btn-primary float-xs-right">{l s='Save' d='Shop.Theme.Actions'}</button>
    {* <a class="js-cancel-address cancel-address float-xs-right" href="{url entity='order' params=['cancelAddress' => {$type}]}">{l s='Cancel' d='Shop.Theme.Actions'}</a> *}
  {else}
      {* <form> *}
      {* <button type="submit" class="continue bg-lbg-primary text-white px-4 py-2 lg:w-1/2 rounded-sm mt-6 text-sm" name="confirm-addresses" value="1">
          {l s='Continue' d='Shop.Theme.Actions'}
      </button>
      {if $customer.addresses|count > 0}
        <a class="js-cancel-address cancel-address float-xs-right" href="{url entity='order' params=['cancelAddress' => {$type}]}">{l s='Cancel' d='Shop.Theme.Actions'}</a>
      {/if} *}
      <div class="flex">
        {if $customer.addresses|count > 0}
          <a class="flex justify-between gap-x-2 js-cancel-address rounded border hover:bg-primary hover:text-white text-lbg-primary border-primary px-4 py-2 md:w-auto mt-6 cancel-address" href="{url entity='order' params=['cancelAddress' => {$type}]}">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 26.537 15.916">
                    <g id="Groupe_3125" data-name="Groupe 3125" transform="translate(-167.125 -1698.379)">
                      <path id="Tracé_1728" data-name="Tracé 1728" d="M175.958,4992.152H153.673" transform="translate(16.203 -3285.652)" fill="none" stroke="#00a191" stroke-linecap="round" stroke-width="3"/>
                      <path id="Tracé_1729" data-name="Tracé 1729" d="M159.825,4986.154l-6.461,6.438,6.461,5.246" transform="translate(16 -3285.654)" fill="none" stroke="#00a191" stroke-linecap="round" stroke-width="3"/>
                    </g>
            </svg>
            {l s='Retour' d='Shop.Theme.Actions'}
          </a>
          {* <a class="js-cancel-address bg-lbg-primary text-white px-4 py-2 lg:w-1/2 cancel-address" href="{url entity='order' params=['cancelAddress' => {$type}]}">{l s='Cancel' d='Shop.Theme.Actions'}</a> *}
        {/if}
        <span class="mx-4"></span>
        <button type="submit" class="continue hover:bg-primary bg-lbg-primary text-white px-4 py-2 lg:w-1/2 rounded-sm mt-6 text-sm" name="confirm-addresses" value="1">
          {l s='Continue' d='Shop.Theme.Actions'}  
        </button>
      </div>
    {* </form> *}
  {/if}
{/block}
