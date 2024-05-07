{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
  <script>
  $(document).ready(function() {
    $('.payment-options input[type="radio"]').change(function() {
      $('.payment-options .payment-option').removeClass('selected')
      if ($(this).is(':checked')) {
        $(this).closest('.payment-option').addClass('selected')
      }
    });
  });
  </script>

  {hook h='displayPaymentTop'}

  <div class="md:border-b pb-4 mb-2 md:mb-6 border-gray-400">
    <h1 class="text-3xl md:text-4xl font-bold">
      <span class="hidden md:block">{l s='Choisir le mode de paiement' d='Shop.Theme.Checkout'}</span>
      <span class="md:hidden">{l s='Paiement' d='Shop.Theme.Checkout'}</span>
    </h1>
  </div>

  {* used by javascript to correctly handle cart updates when we are on payment step (eg vouchers added) *}
  <div style="display:none" class="js-cart-payment-step-refresh"></div>

  {if !empty($display_transaction_updated_info)}
  <p class="cart-payment-step-refreshed-info">
    {l s='Transaction amount has been correctly updated' d='Shop.Theme.Checkout'}
  </p>
  {/if}

  {if $is_free}
    <p>{l s='No payment needed for this order' d='Shop.Theme.Checkout'}</p>
  {/if}
  <div class="payment-options {if $is_free}hidden-xs-up{/if} flex flex-col">
    {foreach from=$payment_options item="module_options"}
      {foreach from=$module_options item="option"}
        <div class="mb-4">
          <div id="{$option.id}-container" class="payment-option clearfix border border-gray-400 px-3 py-2 flex items-center">
            {* This is the way an option should be selected when Javascript is enabled *}
            <span class="custom-radio float-xs-left">
              <input
                class="ps-shown-by-js {if $option.binary} binary {/if}"
                id="{$option.id}"
                data-module-name="{$option.module_name}"
                name="payment-option"
                type="radio"
                required
                {if ($selected_payment_option == $option.id || $is_free) || ($payment_options|@count === 1 && $module_options|@count === 1)} checked {/if}
              >
              <span></span>
            </span>
            {* This is the way an option should be selected when Javascript is disabled *}
            <form method="GET" class="ps-hidden-by-js">
              {if $option.id === $selected_payment_option}
                {l s='Selected' d='Shop.Theme.Checkout'}
              {else}
                <button class="ps-hidden-by-js" type="submit" name="select_payment_option" value="{$option.id}">
                  {l s='Choose' d='Shop.Theme.Actions'}
                </button>
              {/if}
            </form>

            <label for="{$option.id}" class="flex items-center space-x-4">
              <span>{$option.call_to_action_text}</span>
              {if $option.logo}
                <img src="{$option.logo}" loading="lazy">
              {else}
                {if $option.module_name === "mandatadministratif"}
                  <img src='{$urls.img_url}logo-mandat.png' class="h-8 rounded-sm" />
                {else if $option.module_name === 'ps_wirepayment'}
                  <img src='{$urls.img_url}logo-virement.png' class="h-8 rounded-sm" />
                {/if}
              {/if}
            </label>

          </div>
        </div>

        {if $option.additionalInformation}
          <div
            x-cloak
            {if $option.module_name !== "paypal"} style="background: #FF7E1C;"{/if}
            id="{$option.id}-additional-information"
            class="mb-4 js-additional-information definition-list additional-information{if $option.id != $selected_payment_option} ps-hidden {/if} {if $option.module_name !== "paypal"} text-white text-sm px-5 py-3 rounded-sm{/if}"
          >
            {$option.additionalInformation nofilter}
          </div>
        {/if}

        <div
          id="pay-with-{$option.id}-form"
          class="js-payment-option-form {if $option.id != $selected_payment_option} ps-hidden {/if}"
        >
          {if $option.form}
            {$option.form nofilter}
          {else}
            <form id="payment-form" method="POST" action="{$option.action nofilter}">
              {foreach from=$option.inputs item=input}
                <input type="{$input.type}" name="{$input.name}" value="{$input.value}">
              {/foreach}
              <button style="display:none" id="pay-with-{$option.id}" type="submit"></button>
            </form>
          {/if}
        </div>
      {/foreach}
    {foreachelse}
      <p class="alert alert-danger">{l s='Unfortunately, there are no payment method available.' d='Shop.Theme.Checkout'}</p>
    {/foreach}
  </div>

  {if $conditions_to_approve|count}
    <p class="ps-hidden-by-js text-sm">
      {* At the moment, we're not showing the checkboxes when JS is disabled
         because it makes ensuring they were checked very tricky and overcomplicates
         the template. Might change later.
      *}
      {l s='By confirming the order, you certify that you have read and agree with all of the conditions below:' d='Shop.Theme.Checkout'}
    </p>

    <form id="conditions-to-approve" class="js-conditions-to-approve" method="GET">
      <ul>
        {foreach from=$conditions_to_approve item="condition" key="condition_name"}
          <li>
            <div class="float-xs-left">
              <span class="custom-checkbox">
                <input  id    = "conditions_to_approve[{$condition_name}]"
                        name  = "conditions_to_approve[{$condition_name}]"
                        required
                        type  = "checkbox"
                        value = "1"
                        class = "ps-shown-by-js"
                        checked
                >
                <span>
                  <svg style="margin-left:0;" class="-mt-0.5 -ml-0.5 rtl-no-flip checkbox-checked" xmlns="http://www.w3.org/2000/svg" width="16" height="18" viewBox="0 0 19.74 21.26">
                    <path id="Tracé_1696" data-name="Tracé 1696" d="M-1941-13190.43l6.244,6.244,6.893-14.48" transform="translate(89.683 13342.628) rotate(8)" fill="none" stroke="#02b57e" stroke-linecap="round" stroke-width="3"/>
                  </svg>
                </span>
              </span>
            </div>
            <div class="condition-label">
              <label class="js-terms" for="conditions_to_approve[{$condition_name}]">
                {$condition nofilter}
              </label>
            </div>
          </li>
        {/foreach}
      </ul>
    </form>
  {/if}

  {if $show_final_summary}
    {include file='checkout/_partials/order-final-summary.tpl'}
  {/if}

  <div id="payment-confirmation" class="js-payment-confirmation mt-8">
    <div class="ps-shown-by-js">
      <button type="submit" class="text-white px-4 py-3 md:py-2 w-full lg:w-1/2 rounded-sm text-sm bg-lbg-primary hover:bg-primary {if !$selected_payment_option} disabled {else} {/if}">
        {l s='Valider et payer' d='Shop.Theme.Checkout'}
      </button>
      {* {if $show_final_summary} *}
        {if count($payment_options) > 1 || (count($payment_options) == 1 && !isset($payment_options['free_order']))}
          <article class="alert alert-danger mt-2 js-alert-payment-conditions" role="alert" data-alert="danger">
            {l
              s='Please make sure you\'ve chosen a [1]payment method[/1] and accepted the [2]terms and conditions[/2].'
              sprintf=[
                '[1]' => '<a href="#checkout-payment-step">',
                '[/1]' => '</a>',
                '[2]' => '<a href="#conditions-to-approve">',
                '[/2]' => '</a>'
              ]
              d='Shop.Theme.Checkout'
            }
          </article>
        {/if}
      {* {/if} *}
    </div>
    <div class="ps-hidden-by-js">
      {if $selected_payment_option and $all_conditions_approved}
        <label for="pay-with-{$selected_payment_option}">{l s='Order with an obligation to pay' d='Shop.Theme.Checkout'}</label>
      {/if}
    </div>
  </div>

  {hook h='displayPaymentByBinaries'}
{/block}
