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
 {block name='login_form'}

  {block name='login_form_errors'}
    
    {if isset($errors_custom_checkout)}
      {assign var="errors" value=$errors_custom_checkout scope="global"}
    {/if}

    {include file='_partials/form-errors.tpl' errors=$errors['']}
  {/block}

  {assign var="authentification_step" value=false scope="global"}
  {if isset($checkout_custom_step_email)}
    {if ($checkout_custom_step_is_customer_exist == true)}
      {$formFields['email']['value'] = $checkout_custom_step_email}
      {assign var="authentification_step" value=true scope="global"}
    {/if}
  {/if}

  {* Mettre le fous automatiquement sur le champ mot de passe *}
  {$formFields['password']['attr'] = ['autofocus']}

  <form id="login-form" action="{block name='login_form_actionurl'}{$action}{/block}" method="post">
    <div class="{if $page.page_name != "authentication"} md:mr-5 md:ml-5  gap-2 {else} md:mr-5 md:ml-5 gap-8 {/if} flex flex-col">
        {block name='login_form_fields'}
          {assign var="is_email_field_authentication" value=false scope="global"}
          {foreach from=$formFields item="field"}
            {if ($authentification_step == true && $field["type"] == 'email')}
              {* On va mettre le champ mail en disabled *}
              {$field['attr'] = ['disabled']}
              {$field['additional_class'] = 'border-b-2 border-primary-focused grid grid-col-1'}
              {$field['type'] = 'show_value_for_hidden_field'}
              {* Pour donner un attribut au bouton de modif de la valeur visible *}
              {$field['update_visible_value'] = '
                <span class="edit-email-container">
                  <a 
                    @click="editEmail = true;"
                    href="#first" 
                    class="group h-7 w-6 inline-block">
                      <svg class="h-7 inline-block group-hover:hidden" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="19.539" height="19.373" viewBox="0 0 19.539 19.373">
                        <defs>
                          <clipPath id="clip-path">
                            <rect id="Rectangle_1976" data-name="Rectangle 1976" width="19.539" height="19.373" fill="none"/>
                          </clipPath>
                        </defs>
                        <g>
                          <g id="Groupe_3059" data-name="Groupe 3059" clip-path="url(#clip-path)">
                            <path id="Tracé_1678" data-name="Tracé 1678" d="M19.31,27.3H.3a.178.178,0,0,1,0-.356H19.31a.178.178,0,0,1,0,.356" transform="translate(-0.037 -8.012)" fill="#191310"/>
                            <path id="Tracé_1679" data-name="Tracé 1679" d="M19.31,27.3H.3a.178.178,0,0,1,0-.356H19.31a.178.178,0,0,1,0,.356Z" transform="translate(-0.037 -8.012)" fill="none" stroke="#181311" stroke-miterlimit="10" stroke-width="0.25"/>
                            <path id="Tracé_1680" data-name="Tracé 1680" d="M15.862.655l-.217-.15A1.911,1.911,0,0,0,14.173.02a2.219,2.219,0,0,0-1.39,1.044q-.5.721-.963,1.371l-.011.015c-.723,1.027-1.348,1.912-1.863,2.742-.434.7-2.617,3.836-4.212,6.125l-.029.041C3.745,14.176,3.6,14.395,3.56,14.484c-.24.578-.9,2.553.756,3.69a2.846,2.846,0,0,0,1.634.537,2.473,2.473,0,0,0,.443-.042l0,.011.266-.065.065-.024a3.385,3.385,0,0,0,1.61-1.034C8.68,17.1,9.557,15.9,10.308,14.7l.315-.505c2.284-3.675,3.638-5.8,4.023-6.328.531-.72,1.548-2.229,1.96-2.845l0-.006a6.577,6.577,0,0,0,1.038-1.45c.719-1.255-1.165-2.5-1.786-2.909m1.2,2.574h0a7.429,7.429,0,0,1-.781,1.149c-.66-.38-2.383-1.625-3.36-2.347L12.951,2c.126-.179.251-.357.384-.549a1.61,1.61,0,0,1,.951-.764,1.363,1.363,0,0,1,.967.367l.238.166c1.315.867,1.844,1.544,1.575,2.014M5.41,15.95A.664.664,0,0,0,6,15.785c.044-.039.06-.033.072-.028a.7.7,0,0,1,.268.569.6.6,0,0,0,.271.436A1.308,1.308,0,0,0,7.544,17a.137.137,0,0,1,.112.041.176.176,0,0,1,.06.15.244.244,0,0,0,0,.051,3.035,3.035,0,0,1-1.121.691c-.155-.169-.433-.436-.891-.856a3.615,3.615,0,0,0-1.8-.977,3.557,3.557,0,0,1,.267-1.343c.007-.013.034-.054.073-.112.09.027.33.15.479.7a1.154,1.154,0,0,0,.685.606M7,16.227a1.3,1.3,0,0,0-.675-1.088.719.719,0,0,0-.767.135l-.021.018a.618.618,0,0,1-.2-.206,1.473,1.473,0,0,0-.712-1c.4-.575,1-1.439,1.631-2.347,1.7-2.443,3.819-5.484,4.256-6.189.372-.6.813-1.245,1.357-2.022l3.364,2.317c-.514.754-.9,1.3-1.135,1.624h0c-.56.762-2.861,4.457-3.968,6.233l-.4.644c-.522.838-1.121,1.691-1.549,2.284a.743.743,0,0,0-.083-.086.812.812,0,0,0-.544-.214.7.7,0,0,0-.157.017.746.746,0,0,1-.4-.117" transform="translate(-0.96 0)" fill="#191310"/>
                          </g>
                        </g>
                      </svg>  

                      <svg class="h-7 hidden group-hover:inline-block" id="Composant_76_3" data-name="Composant 76 – 3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="19.539" height="19.084" viewBox="0 0 19.539 19.084">
                        <defs>
                          <clipPath id="clip-path">
                            <rect id="Rectangle_1977" data-name="Rectangle 1977" width="19.539" height="19.084" fill="none"/>
                          </clipPath>
                        </defs>
                        <g id="Composant_75_1" data-name="Composant 75 – 1">
                          <g id="Groupe_3060" data-name="Groupe 3060" clip-path="url(#clip-path)">
                            <path id="Tracé_1681" data-name="Tracé 1681" d="M3.894,5.525l.153.216h0l.055.074c.642.9,1.214,1.7,1.768,2.39.516.641,2.765,3.77,4.407,6.054,1.9,2.65,2.153,2.992,2.222,3.052a3.628,3.628,0,0,0,2.244.984,2.331,2.331,0,0,0,1.4-.474,2.772,2.772,0,0,0,1.026-1.329,2.589,2.589,0,0,0,.115-.486h.008l.025-.247,0,0a3.292,3.292,0,0,0-.427-1.836c-.175-.261-1.1-1.624-2.04-2.806l-.372-.465c-1.01-1.261-4.084-5.1-4.632-5.9-.566-.833-1.9-2.616-2.037-2.8A6.3,6.3,0,0,0,6.787.492c-.9-1.047-2.664.289-3.241.727l-.215.155a1.86,1.86,0,0,0-.92,1.182,2.154,2.154,0,0,0,.509,1.605q.514.711.975,1.363M16.789,15.7c-.208.083-.544.249-1.146.571a3.43,3.43,0,0,0-1.518,1.4,3.561,3.561,0,0,1-1.266-.736c-.013-.015-.056-.072-.112-.149h0c.006-.014.144-.351.892-.293a1.074,1.074,0,0,0,.748-.411.6.6,0,0,0,.034-.547c-.037-.094,0-.13.013-.149a.755.755,0,0,1,.695-.083.538.538,0,0,0,.444-.1,1.221,1.221,0,0,0,.505-.757.2.2,0,0,1,.112-.145.248.248,0,0,1,.226-.01.222.222,0,0,0,.067.017,2.981,2.981,0,0,1,.306,1.4m-.854-1.871a.734.734,0,0,0-.383.541.778.778,0,0,1-.3.41,1.246,1.246,0,0,0-1.211.246.651.651,0,0,0-.113.7c.021.056.011.076.007.082a.62.62,0,0,1-.318.155,1.337,1.337,0,0,0-1.194.378c-.415-.573-1.064-1.476-1.7-2.363l-.013-.018c-1.739-2.42-3.9-5.43-4.424-6.078-.472-.587-.972-1.275-1.5-2.012L8.2,3.377c.425.578.909,1.245,1.2,1.669.54.795,3.4,4.37,4.624,5.9l.4.506c.67.84,1.315,1.75,1.7,2.3a.787.787,0,0,0-.188.072M3.806,4.488c-.152-.213-.3-.415-.455-.637a1.667,1.667,0,0,1-.417-1.2.86.86,0,0,1,.034-.13h0a1.573,1.573,0,0,1,.663-.7l.234-.169A4.422,4.422,0,0,1,5.887.629a.623.623,0,0,1,.5.21,7.074,7.074,0,0,1,.859,1.18C6.7,2.5,4.777,3.831,3.806,4.488" transform="translate(-0.71 -0.03)" fill="#00a193"/>
                            <path id="Tracé_1682" data-name="Tracé 1682" d="M14.712,18.336a3.691,3.691,0,0,1-2.291-1c-.074-.065-.283-.352-2.233-3.063C8.546,11.988,6.3,8.861,5.784,8.22c-.561-.7-1.134-1.5-1.771-2.394L3.924,5.7h0l-.119-.167q-.46-.65-.973-1.363a2.226,2.226,0,0,1-.522-1.659,1.926,1.926,0,0,1,.951-1.228l.213-.154C4.066.684,5.866-.679,6.81.416A6.387,6.387,0,0,1,7.837,1.891c.131.167,1.464,1.953,2.03,2.787.542.8,3.6,4.615,4.6,5.87l.4.495c.945,1.182,1.868,2.548,2.044,2.81a3.388,3.388,0,0,1,.441,1.841h0v.044l-.032.316h-.012a2.564,2.564,0,0,1-.107.433,2.851,2.851,0,0,1-1.051,1.362,2.417,2.417,0,0,1-1.44.486M4.108,5.719l.019.025c.636.9,1.207,1.693,1.766,2.389.518.644,2.767,3.772,4.409,6.056,1.79,2.491,2.146,2.983,2.212,3.04a3.546,3.546,0,0,0,2.2.966,2.276,2.276,0,0,0,1.358-.46,2.7,2.7,0,0,0,1-1.295,2.467,2.467,0,0,0,.112-.472l.01-.065h0l.015-.148v-.032a3.242,3.242,0,0,0-.416-1.794c-.175-.261-1.1-1.622-2.038-2.8l-.395-.495C13.356,9.38,10.3,5.559,9.75,4.757c-.564-.832-1.894-2.613-2.033-2.8A6.352,6.352,0,0,0,6.7.508c-.856-1-2.579.308-3.145.737L3.341,1.4A1.8,1.8,0,0,0,2.45,2.539a2.091,2.091,0,0,0,.5,1.552q.514.712.975,1.364Zm10.023,12-.056-.017a3.647,3.647,0,0,1-1.293-.75c-.02-.022-.065-.081-.122-.159l-.014-.019V16.7l.018-.009c.05-.093.254-.364.951-.311a1,1,0,0,0,.683-.377.53.53,0,0,0,.028-.485.194.194,0,0,1,.026-.222.825.825,0,0,1,.766-.1A.466.466,0,0,0,15.5,15.1a1.154,1.154,0,0,0,.475-.707.271.271,0,0,1,.148-.2.313.313,0,0,1,.289-.011.128.128,0,0,0,.036.008l.035.006.028.034a3.076,3.076,0,0,1,.313,1.432l0,.045-.042.017c-.209.084-.549.253-1.139.568a3.388,3.388,0,0,0-1.488,1.365ZM12.8,16.742c.041.056.072.1.082.108a3.54,3.54,0,0,0,1.178.7,3.561,3.561,0,0,1,1.52-1.373c.556-.3.894-.466,1.11-.556a2.921,2.921,0,0,0-.285-1.286.218.218,0,0,1-.05-.016.178.178,0,0,0-.162.008.136.136,0,0,0-.076.093,1.293,1.293,0,0,1-.536.8.6.6,0,0,1-.5.111.7.7,0,0,0-.625.063c-.009.01-.02.022,0,.077a.672.672,0,0,1-.039.608,1.148,1.148,0,0,1-.8.445c-.573-.044-.764.144-.818.219m-.415-.328-.051-.072c-.392-.54-.993-1.376-1.595-2.214l-.12-.167C8.977,11.675,6.727,8.545,6.2,7.887,5.7,7.273,5.184,6.555,4.7,5.872l-.041-.057.056-.041L8.187,3.249l.041.056c.556.757.959,1.319,1.2,1.672.542.8,3.4,4.367,4.621,5.893l.4.505c.653.818,1.284,1.706,1.7,2.307l.058.084-.1.025a.719.719,0,0,0-.171.066.658.658,0,0,0-.346.488.833.833,0,0,1-.344.464l-.022.01-.024-.006a1.185,1.185,0,0,0-1.14.225.583.583,0,0,0-.1.623.164.164,0,0,1,0,.141c-.077.128-.363.19-.365.191l-.011,0h-.009a1.287,1.287,0,0,0-1.136.353ZM4.852,5.846c.474.665.977,1.358,1.456,1.953.531.661,2.782,3.793,4.426,6.08l.12.167c.578.8,1.154,1.6,1.546,2.145a1.469,1.469,0,0,1,1.182-.339.618.618,0,0,0,.259-.116l-.01-.025a.719.719,0,0,1,.127-.768,1.308,1.308,0,0,1,1.251-.273.756.756,0,0,0,.244-.342.8.8,0,0,1,.419-.6.775.775,0,0,1,.11-.049c-.412-.6-1.016-1.441-1.638-2.221l-.405-.505c-1.221-1.527-4.082-5.1-4.627-5.9-.232-.341-.619-.883-1.153-1.61ZM3.759,4.554,3.649,4.4c-.127-.178-.25-.351-.385-.539a1.732,1.732,0,0,1-.43-1.255.943.943,0,0,1,.037-.141l.006-.016a1.654,1.654,0,0,1,.684-.725l.232-.167A4.478,4.478,0,0,1,5.856.528a.694.694,0,0,1,.552.235,7.2,7.2,0,0,1,.867,1.192L7.3,2l-.042.038c-.644.575-3.16,2.281-3.444,2.475ZM3,2.527a.691.691,0,0,0-.026.1,1.606,1.606,0,0,0,.405,1.148c.135.188.259.361.386.54l.03.042C5.03,3.523,6.6,2.425,7.124,1.974A7.276,7.276,0,0,0,6.3.855.548.548,0,0,0,5.856.669a4.4,4.4,0,0,0-1.978,1l-.237.171A1.521,1.521,0,0,0,3,2.511Z" transform="translate(-0.681 0)" fill="#00a193"/>
                            <path id="Tracé_1683" data-name="Tracé 1683" d="M19.273,26.407H.266a.265.265,0,1,0,0,.53H19.273a.265.265,0,1,0,0-.53" transform="translate(0 -7.854)" fill="#00a193"/>
                          </g>
                        </g>
                      </svg>
                  </a>
                </span>
              '}
              {$field['show_value_for_hidden_field'] = $field["value"]}
              {assign var="is_email_field_authentication" value=true scope="global"}
            {/if}
            {if ($is_email_field_authentication)}
              <div class="relative">
            {/if}
              {block name='form_field'}
                {form_field field=$field}
              {/block}
            {if ($is_email_field_authentication)}
              </div>
            {/if}
          {/foreach}
        {/block}
        <div class="flex items-center gap-4">
            <label class="flex items-center relative w-max cursor-pointer select-none">
              <input type="checkbox" class="switcher border-none appearance-none transition-colors cursor-pointer w-16 h-8 rounded-full focus:outline-none bg-gray-400" />
              <span class="w-6 h-6 left-1.5 shadow-sm absolute rounded-full transform transition-transform bg-white"></span>
            </label>
            <span class="text-black">Se souvenir de moi</span>
        </div>
        {block name='login_form_footer'}
        <div class="flex items-center">
          <div class="w-full md:w-1/3 flex flex-col gap-2">
            <input type="hidden" name="submitLogin" value="1">
            {block name='form_buttons'}
              <button id="submit-login" data-link-action="sign-in" type="submit" class="w-full hover:bg-primary continue bg-lbg-primary text-white text-sm py-3 md:py-2 rounded-sm {if $page.page_name != "authentication"}  mt-3 {else} {/if}">
                  {l s='Connexion' d='Shop.Theme.Actions'}
              </button>
              <div class="mt-2">
                <a class="text-sm" href="{$urls.pages.password}" rel="nofollow">
                  {l s='Mot de passe oublié ?' d='Shop.Theme.Customeraccount'}
                </a>
              </div>
            {/block}
          </div>
        </div>
        {/block}
    </div>
  </form>

  <form class="hidden" id="login-form" action="{block name='login_form_actionurl'}{$action}{/block}" method="post">

    <div>
      {block name='login_form_fields'}
        {foreach from=$formFields item="field"}
          {block name='form_field'}
            {form_field field=$field}
          {/block}
        {/foreach}
      {/block}
      {hook h='displayPaCaptcha' posTo='login'}<div class="forgot-password">
        <a href="{$urls.pages.password}" rel="nofollow">
          {l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
        </a>
      </div>
    </div>

    {block name='login_form_footer'}
      <footer class="form-footer text-sm-center clearfix">
        <input type="hidden" name="submitLogin" value="1">
        {block name='form_buttons'}
          <button id="submit-login" class="btn btn-primary" data-link-action="sign-in" type="submit" class="form-control-submit">
            {l s='Sign in' d='Shop.Theme.Actions'}.
          </button>
        {/block}
      </footer>
    {/block}

  </form>
{/block}
