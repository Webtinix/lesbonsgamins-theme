{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{block name="address_form"}
  <div class="js-address-form">
    {include file='_partials/form-errors.tpl' errors=$errors['']}

    {block name="address_form_url"}
    <form
      method="POST"
      onsubmit="submitForm(event)"
      action="{url entity='address' params=['id_address' => $id_address]}"
      data-id-address="{$id_address}"
      data-refresh-url="{url entity='address' params=['ajax' => 1, 'action' => 'addressForm']}"
    >
    {/block}

      {block name="address_form_fields"}
        <section class="form-fields grid gap-y-6 md:gap-y-1 grid-cols-1 md:grid-cols-2">
          {block name='form_fields'}
            {* L'alias doit s'étendre sur toute la largeur *}
            {$formFields['alias']['additional_class_for_parent'] = "md:col-span-2 md:py-3"}
            {* {$formFields['company']['additional_class_for_parent'] = "md:col-span-2 md:pt-3"} *}
            {$formFields['company']['additional_class_for_parent'] = "md:col-span-2 md:py-3"}
            {$formFields['company']['additional_class'] = "md:mt-2"}
            {$formFields['address1']['additional_class_for_parent'] = "md:col-span-2 md:pb-3"}
            {$formFields['city']['additional_class_for_parent'] = "md:pb-3"}
            {$formFields['address2']['additional_class_for_parent'] = "md:pb-3"}
            {$formFields['phone']['additional_class_for_parent'] = "md:col-span-2 md:pb-3 relative"}
            {* {$formFields['phone']['errors'] = ["Le numéro de téléphone contient une erreur de saisie"]} *}
            {foreach from=$formFields item="field"}
              {block name='form_field'}
                {* {if $field.name === "phone"}
                  {$field.errors = ["Le numéro de téléphone contient une erreur de saisie"]}
                {/if} *}
                {form_field field=$field}
              {/block}
            {/foreach}
          {/block}
        </section>
      {/block}

      <input type="hidden" name="country_iso_code" value="{if isset($country_iso_code)}{$country_iso_code}{/if}" />

      {block name="address_form_footer"}
      <footer class="form-footer clearfix">
        <input type="hidden" name="submitAddress" value="1">
        {block name='form_buttons'}
          <button class="continue bg-lbg-primary text-white px-4 py-3 md:py-2 w-full lg:w-1/2 rounded-sm mt-6 text-sm" type="submit">
            {l s='Save' d='Shop.Theme.Actions'}
          </button>
        {/block}
      </footer>
      {/block}

    </form>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js"></script>
  <script>
    $(document).ready(function(){
      /* ======== Create phone field */
      var input = document.querySelector("#field-phone");
      console.log(input)
      if(input) {
          let country_iso = $('input[name="country_iso_code"]').val();
          let iti = window.intlTelInput(input, {
              initialCountry: country_iso != "" ? country_iso : "fr",
              utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
              preferredCountries: ['fr', 'gb'],
              separateDialCode: true,
          });

          /* here, the index maps to the error code returned from getValidationError - see readme */
          let errorMap = ["Veuillez renseigner un numéro valide", "L'indicatif du pays est invalid", "Le numéro de téléphone est trop court", "Le numéro de téléphone est trop long", "Veuillez renseigner un numéro valide"];
          
          let reset = function() {
            if (input.value.trim()) {
              if (iti.isValidNumber()) {
                input.classList.remove("border-lbg-danger")                
                input.classList.remove("text-lbg-danger")
                input.classList.add("border-lbg-primary")
                $('#valid-phone-msg').removeClass('hidden')
              } else {
                input.classList.add("border-lbg-danger")             
                input.classList.add("text-lbg-danger")
                input.classList.remove("border-lbg-primary")
                $('#valid-phone-msg').addClass('hidden')

              }
            }
          }

          /* ======== Check phone on submit form function */
          function submitForm(event) {
            console.log('submitted')
            alert('submitted')
            reset()
            if (input.value.trim()) {
              if (iti.isValidNumber()) {

              } else {
                event.preventDefault()
                let errorCode = iti.getValidationError()
                console.log(errorMap[errorCode])
              }
            }
          }

          /* on blur: validate */
          /* on keyup / change flag: reset */
          input.addEventListener('blur', reset)
          input.addEventListener('change', reset)
          input.addEventListener('keyup', reset)

          /* ======== Add dial code to adress form */
          jQuery('<input>', {
              id: 'country_dial_code',
              name: 'country_dial_code',
              type: 'hidden',
          }).appendTo('form');

          $('ul.iti__country-list li.iti__country').on('click', function(){
              let dial_code = $(this).attr('data-dial-code'); 
              $('input#country_dial_code').val(dial_code);
          });
          let dial_code = $('ul.iti__country-list li.iti__country.iti__active').attr('data-dial-code');
          $('input#country_dial_code').val(dial_code);
          
      }
    })
  </script>
{/block}
