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

{assign var=attr value=""}
{if isset($field.attr)}
  {foreach $field.attr as $i_attr => $value_attr}
    {if is_int($i_attr)}
      {assign var=attr value=$attr|cat:' '|cat:$value_attr}
    {else}
      {assign var=attr value=$attr|cat:" "|cat:$i_attr|cat:'="'|cat:$value_attr|cat:'" '}
    {/if}
  {/foreach}
{/if}

{* Pour les class additionnelles des champs, donc elles s'ajoutent aux class qui existent déjà *}
{* Différent de l'attribut 'class' qui remplacera peut être les class déjà existentes *}
{assign var=additional_class value=""}
{if isset($field.additional_class)}
  {assign var=additional_class value=$field.additional_class}
{/if}

{assign var=show_value_for_hidden_field value=""}
{if isset($field.show_value_for_hidden_field)}
  {assign var=show_value_for_hidden_field value=$field.show_value_for_hidden_field}
{/if}

{* Permet d'afficher une case à cocher sur les champs dans la valeur a été mise en dure *}
{assign var=show_check_mark_for_show_value_for_hidden_field value=false}
{if isset($field.show_check_mark_for_show_value_for_hidden_field)}
  {assign var=show_check_mark_for_show_value_for_hidden_field value=$field.show_check_mark_for_show_value_for_hidden_field}
{/if}

{assign var=update_visible_value value=""}
{if isset($field.update_visible_value)}
  {assign var=update_visible_value value=$field.update_visible_value}
{/if}

{assign var=additional_class_for_parent value=""}
{if isset($field.additional_class_for_parent)}
  {assign var=additional_class_for_parent value=$field.additional_class_for_parent}
{/if}

{if $field.type == 'hidden'}

  {block name='form_field_item_hidden'}
    <input type="hidden" name="{$field.name}" value="{$field.value}" {$attr nofilter} class="{$additional_class nofilter}">
  {/block}

{elseif $field.name == "vat_number"}

{else}
  
  {* {$additional_class_for_parent|dump} *}
  {assign var="fieldsArr" value=["firstname", "lastname", "postcode", "address2", "city", "id_country", "company"]}
  {* <div {if $field.name == "company"}x-data="{ showCompany: false }"{/if} class="form-group {if !in_array($field.name, $fieldsArr)}col-span-12{else}col-span-6{/if} {if !empty($field.errors)}has-error{/if}"> *}
  <div 
    {if $field.name == "company"}
      x-data="{ showCompany: false }"
    {elseif $field.type == 'checkbox'}
      x-data="{ checked_{$field.name}: {if $field.value}true{else}false{/if} }"
    {/if} 
    class="w-full {if !empty($field.errors)}placeholder-lbg-danger has-error{/if} {$additional_class_for_parent nofilter}">
    {* <label class="col-md-3 form-control-label{if $field.required} required{/if}" for="field-{$field.name}">
      {if $field.type !== 'checkbox'}
        {$field.label}
      {/if}
    </label> *}
    <div class="w-full {if ($field.type === 'radio-buttons')} form-control-valign{/if}">

      {if $field.name == "company"}
        {* <div class="flex items-center space-x-1 mb-4"> *}
        <div class="flex items-center space-x-1">
          <button type="button" @click="showCompany = !showCompany">
            <svg x-show="!showCompany" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 22 22">
              <g transform="translate(-138 -419)">
                <g id="Rectangle_1881" data-name="Rectangle 1881" transform="translate(138 419)" fill="#fff" stroke="#191310" stroke-width="1">
                  <rect width="22" height="22" rx="3" stroke="none"/>
                  <rect x="0.5" y="0.5" width="21" height="21" rx="2.5" fill="none"/>
                </g>
              </g>
            </svg>        
            <svg x-cloak x-show="showCompany" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 22 22">
              <g fill="#fff" stroke="#00a396" stroke-width="1">
                <rect width="18" height="18" rx="3" stroke="none"/>
                <rect x="0.5" y="0.5" width="21" height="21" rx="2.5" fill="none"/>
              </g>
              <path id="Tracé_1491" data-name="Tracé 1491" d="M-2736-13042.99l4.3,5.908,3.759-10.418" transform="translate(2743 13053.75)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
            </svg>
          </button>
          <span>Société</span>
        </div>
      {/if}

      {if $field.type === 'select'}

        {block name='form_field_item_select'}
          <select id="field-{$field.name}" class="form-control form-control-select {$additional_class nofilter}" name="{$field.name}" {if $field.required}required{/if} {$attr nofilter}>
            <option value disabled selected>{l s='Please choose' d='Shop.Forms.Labels'}</option>
            {foreach from=$field.availableValues item="label" key="value"}
              <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
            {/foreach}
          </select>
        {/block}

      {elseif $field.type === 'countrySelect'}

        {block name='form_field_item_country'}
          <select
            id="field-{$field.name}"
            class="form-control form-control-select js-country {$additional_class nofilter}"
            name="{$field.name}"
            {if $field.required}required{/if}
            {$attr nofilter}
          >
            <option value disabled selected>{l s='Please choose' d='Shop.Forms.Labels'}</option>
            {foreach from=$field.availableValues item="label" key="value"}
              <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
            {/foreach}
          </select>
        {/block}

      {elseif $field.type === 'radio-buttons'}

        {block name='form_field_item_radio'}
          {foreach from=$field.availableValues item="label" key="value"}
            <label class="radio-inline" for="field-{$field.name}-{$value}">
              <span class="custom-radio">
                <input
                  name="{$field.name}"
                  id="field-{$field.name}-{$value}"
                  type="radio"
                  value="{$value}"
                  {if $field.required}required{/if}
                  {if $value eq $field.value} checked {/if}
                >
                <span></span>
              </span>
              {$label}
            </label>
          {/foreach}
        {/block}

      {elseif $field.type === 'checkbox'}
        {block name='form_field_item_checkbox'}
          <div class="flex items-start mb-4">
            <input x-model="checked_{$field.name}" class="hidden {$additional_class nofilter}" name="{$field.name}" type="checkbox" value="1" {if $field.value}checked="checked"{/if} {if $field.required}required{/if} {$attr nofilter}>
            <button type="button" @click="checked_{$field.name} = !checked_{$field.name}">
              <svg x-show="!checked_{$field.name}" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 22 22">
                <g transform="translate(-138 -419)">
                  <g id="Rectangle_1881" data-name="Rectangle 1881" transform="translate(138 419)" fill="#fff" stroke="#191310" stroke-width="1">
                    <rect width="22" height="22" rx="3" stroke="none"/>
                    <rect x="0.5" y="0.5" width="21" height="21" rx="2.5" fill="none"/>
                  </g>
                </g>
              </svg>        
              <svg x-cloak x-show="checked_{$field.name}" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 22 22">
                <g fill="#fff" stroke="#00a396" stroke-width="1">
                  <rect width="18" height="18" rx="3" stroke="none"/>
                  <rect x="0.5" y="0.5" width="21" height="21" rx="2.5" fill="none"/>
                </g>
                <path id="Tracé_1491" data-name="Tracé 1491" d="M-2736-13042.99l4.3,5.908,3.759-10.418" transform="translate(2743 13053.75)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
              </svg>
            </button>
            <span class="px-2 cursor-pointer" @click="checked_{$field.name} = !checked_{$field.name}">{$field.label nofilter}</span>
          </div>
          {* <span class="custom-checkbox">
            <label>
              <input class="{$additional_class nofilter}" name="{$field.name}" type="checkbox" value="1" {if $field.value}checked="checked"{/if} {if $field.required}required{/if} {$attr nofilter}>
              <span><i class="material-icons rtl-no-flip checkbox-checked">&#xE5CA;</i></span>
              {$field.label nofilter}
            </label>
          </span> *}
        {/block}
      {elseif $field.type === 'date'}

        {block name='form_field_item_date'}
          <input id="field-{$field.name}" name="{$field.name}" class="form-control {$additional_class nofilter}" type="date" value="{$field.value}"{if isset($field.availableValues.placeholder)} placeholder="{$field.availableValues.placeholder}"{/if} {$attr nofilter}>
          {if isset($field.availableValues.comment)}
            <span class="form-control-comment">
              {$field.availableValues.comment}
            </span>
          {/if}
        {/block}

      {elseif $field.type === 'birthday'}

        {block name='form_field_item_birthday'}
          <div class="js-parent-focus">
            {html_select_date
            field_order=DMY
            time={$field.value}
            field_array={$field.name}
            prefix=false
            reverse_years=true
            field_separator='<br>'
            day_extra='class="form-control form-control-select"'
            month_extra='class="form-control form-control-select"'
            year_extra='class="form-control form-control-select"'
            day_empty={l s='-- day --' d='Shop.Forms.Labels'}
            month_empty={l s='-- month --' d='Shop.Forms.Labels'}
            year_empty={l s='-- year --' d='Shop.Forms.Labels'}
            start_year={'Y'|date}-100 end_year={'Y'|date}
            }
          </div>
        {/block}

      {elseif $field.type === 'password'}

        {block name='form_field_item_password'}
          <div data-groupe="password" class="form-group">
            <div x-data="{ showPassword_{$field.name}: false }" class="relative input-group js-parent-focus">
              <input
                id="field-{$field.name}"
                class="w-full border-b-2 pb-1.5 text-sm focus:border-focused {$additional_class nofilter}"
                name="{$field.name}"
                title="{l s='At least 5 characters long' d='Shop.Forms.Help'}"
                aria-label="{l s='Password input of at least 5 characters' d='Shop.Forms.Help'}"
                {* type="password" *}
                x-bind:type="showPassword_{$field.name} ? 'text' : 'password'"
                {if $field.autocomplete}autocomplete="{$field.autocomplete}"{/if}
                value=""
                {if isset($field.availableValues.placeholder)}
                  placeholder="{$field.availableValues.placeholder}"
                {else}
                  placeholder="{$field.label}"
                {/if}
                pattern=".{literal}{{/literal}5,{literal}}{/literal}"
                {if $field.required}required{/if}
                {$attr nofilter}/>
              <span @click="showPassword_{$field.name} = !showPassword_{$field.name}" class="absolute h-7 w-7 right-0 bottom-0">
                <svg id="Calque_1" data-name="Calque 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28.35 25.23">
                  <defs>
                    <style>
                      .cls-1 {
                        fill: #00a193;
                      }
                
                      .cls-1, .cls-2 {
                        stroke-width: 0px;
                      }
                
                      .cls-2 {
                        fill: #fff;
                      }
                    </style>
                  </defs>
                  <path class="cls-2" d="m6.8,20.07s-1.64.26-2.05.97"/>
                  <path class="cls-2" d="m23.67,10.09s-.06-.8,1.17-1.22"/>
                  <path class="cls-2" d="m17.76,2.87s.32-1.23,1.23-.91"/>
                  <g>
                    <path class="cls-1" d="m13.28,1.03c-.13.31-.22.95-.22,1.42,0,1.42.33,1.99,1.11,1.99s1.11-.57,1.11-1.99-.33-1.99-1.11-1.99c-.53,0-.73.13-.88.57Z"/>
                    <path class="cls-1" d="m4.12,4.57c-.53.53-.44.91.55,1.97,1,1.08,1.79,1.42,2.3,1,.57-.49.35-1.15-.75-2.23-1.13-1.15-1.55-1.3-2.1-.73Z"/>
                    <path class="cls-1" d="m22.1,5.3c-1.11,1.08-1.33,1.75-.75,2.23.51.42,1.3.09,2.3-1,1-1.06,1.08-1.44.55-1.97-.55-.57-.97-.42-2.1.73Z"/>
                    <path class="cls-1" d="m12.5,9.3c-3.8.57-7.45,2.48-10.99,5.73-1.72,1.57-1.72,2.01,0,3.58,8.38,7.69,16.92,7.69,25.32,0,1.7-1.57,1.7-2.01,0-3.58-4.64-4.22-10.04-6.39-14.33-5.73Zm4.67,2.76c.66.42,1.33,1.08,1.75,1.75.6,1,.66,1.26.66,3.01s-.07,2.01-.66,3.01c-.42.66-1.08,1.33-1.75,1.75-1,.6-1.26.66-3.01.66s-2.01-.07-3.01-.66c-1.55-.97-2.37-2.39-2.48-4.31-.15-2.56.82-4.36,2.87-5.4,1.02-.53,1.39-.6,2.85-.53,1.39.04,1.84.18,2.76.73Zm-10.1,2.1c-.55,1.48-.55,3.83,0,5.31l.42,1.08-.6-.29c-.82-.44-3.12-2.19-3.76-2.87l-.55-.57.77-.8c.62-.64,3.8-2.96,4.07-2.96.04,0-.11.51-.35,1.11Zm16.05.33c.73.53,1.61,1.26,1.97,1.64l.66.69-.66.69c-.64.69-2.87,2.37-3.76,2.81l-.49.27.42-1.11c.27-.71.42-1.68.42-2.65s-.15-1.95-.42-2.65l-.42-1.11.49.27c.24.13,1.06.66,1.79,1.17Z"/>
                    <path class="cls-1" d="m12.46,14.17c-1.92,1.15-1.84,4.38.13,5.42,2.17,1.11,4.67-.35,4.67-2.72,0-1.88-1.24-3.14-3.1-3.14-.6,0-1.28.18-1.7.44Zm2.54,1.81c.15.15.27.53.27.84,0,.73-.38,1.11-1.11,1.11s-1.11-.38-1.11-1.11c0-.31.11-.69.27-.84s.53-.27.84-.27.69.11.84.27Z"/>
                  </g>
                </svg>
              </span>
            </div>
            <span class="text_mdp_non_valide_form_choisir_mdp hidden text-red-500 text-xs "></span>
            <p class="text-sm md:w-10/12">Le mot de passe doit contenir au moins 8 caractères, 1 minuscule, 1 majuscule, 1 chiffre et 1 caractère spécial.</p>
          </div>
        {/block}
      {elseif $field.type === 'show_value_for_hidden_field'}

        {block name='show_value_for_hidden_field'}
          {if $show_value_for_hidden_field != ''}
            <div class="relative">
              <input type="hidden" name="{$field.name}" value="{$show_value_for_hidden_field}">
              <div class="grid grid-col-1">
                <div class="{$additional_class nofilter}">
                  {$show_value_for_hidden_field nofilter}
                </div>
              </div>
              {if $show_check_mark_for_show_value_for_hidden_field}
                <svg class="absolute right-{if $update_visible_value != ''}7{else}1{/if} top-1" xmlns="http://www.w3.org/2000/svg" width="10.844" height="11.086" viewBox="0 0 10.844 11.086">
                  <path id="Tracé_1695" data-name="Tracé 1695" d="M-1941-13194.391l3.241,3.242,3.578-7.518" transform="translate(87.797 13341.869) rotate(8)" fill="none" stroke="#02b57e" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
                </svg>
              {/if}
              {if $update_visible_value != ''}
                <span class="absolute right-1 bottom-1">{$update_visible_value nofilter}</span>
              {/if}
            </div>
          {/if}
        {/block}

      {else}

        {block name='form_field_item_other'}
          {* {$field|@var_dump} *}
          <input
            id="field-{$field.name}"
            class="w-full border-b-2 pb-1.5 text-sm focus:border-focused {$additional_class nofilter} {if !empty($field.errors)}border-lbg-danger text-lbg-danger{/if}"
            name="{$field.name}"
            type="{$field.type}"
            {if $field.name == "alias" && $field.value == null}
              value="Mon adresse"
            {else}
              value="{$field.value}"
            {/if}
            {if $field.autocomplete}autocomplete="{$field.autocomplete}"{/if}
            {if isset($field.availableValues.placeholder)}
              placeholder="{$field.availableValues.placeholder}"
            {else}
              placeholder="{$field.label}"
            {/if}
            {if $field.maxLength}maxlength="{$field.maxLength}"{/if}
            {if $field.required}required{/if}
            {if $field.name == "company"}
              x-show="showCompany" x-cloak
            {/if}
            {$attr nofilter}
          >
          {if isset($field.availableValues.comment)}
            <span class="form-control-comment">
              {$field.availableValues.comment}
            </span>
          {/if}
          {if $field.type == 'tel' && $field.name == 'phone'}
            <span id="valid-phone-msg" class="hidden absolute right-4 top-0.5 text-lbg-primary">
              <svg class="svg-inline--fa fa-check fa-w-16" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                  <path class="text-lbg-primary" fill="currentColor" d="M173.898 439.404l-166.4-166.4c-9.997-9.997-9.997-26.206 0-36.204l36.203-36.204c9.997-9.998 26.207-9.998 36.204 0L192 312.69 432.095 72.596c9.997-9.997 26.207-9.997 36.204 0l36.203 36.204c9.997 9.997 9.997 26.206 0 36.204l-294.4 294.401c-9.998 9.997-26.207 9.997-36.204-.001z"></path>
                </svg>
            </span>
          {/if}
        {/block}

      {/if}

      {block name='form_field_errors'}
        {include file='_partials/form-errors.tpl' errors=$field.errors}
      {/block}

    </div>

    <div class="col-md-3 form-control-comment">
      {block name='form_field_comment'}
        {if (!$field.required && !in_array($field.type, ['radio-buttons', 'checkbox']))}
         {l s='Optional' d='Shop.Forms.Labels'}
        {/if}
      {/block}
    </div>
  </div>

{/if}
