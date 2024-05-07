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
{extends file='customer/my-account.tpl'}

{block name='wx_menu_page_title'}
  {l s='Mes commandes' d='Shop.Theme.Customeraccount'}
{/block}

{block name='wx_container_menu_items'}
  {if $orders}
    <table class="mt-7 table table-labeled hidden-sm-down">
      <thead class="">
        <tr>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-r-2">{l s='Référence' d='Shop.Theme.Checkout'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-l-2 border-r-2">{l s='Date' d='Shop.Theme.Checkout'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-l-2 border-r-2">{l s='Prix total' d='Shop.Theme.Checkout'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-l-2 border-r-2 hidden-md-down">{l s='Paiement' d='Shop.Theme.Checkout'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-l-2 border-r-2 hidden-md-down">{l s='Statut' d='Shop.Theme.Checkout'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-l-2 border-r-2">{l s='Facture' d='Shop.Theme.Checkout'}</th>
          <th class="border-silver-my-account-history text-center font-normal p-2 border-l-2">{l s='Actions' d='Shop.Theme.Checkout'}</th>
        </tr>
      </thead>
      <tbody>
        {foreach from=$orders item=order}
          <tr>
            <th class="border-silver-my-account-history font-normal p-5 px-0 border-b-2 border-t-2 border-r-2">#{$order.details.reference}</th>
            <td class="border-silver-my-account-history text-center p-5 border-b-2 border-t-2 border-l-2 border-r-2">{$order.details.order_date}</td>
            <td class="border-silver-my-account-history text-center p-5 border-b-2 border-t-2 border-l-2 border-r-2 text-xs-right">{$order.totals.total.value}</td>
            <td class="border-silver-my-account-history text-center p-5 border-b-2 border-t-2 border-l-2 border-r-2 hidden-md-down">{$order.details.payment}</td>
            <td class="border-silver-my-account-history text-center p-5 border-b-2 border-t-2 border-l-2 border-r-2">
              <span
                class="inline-block p-3 rounded {$order.history.current.contrast}"
                style="background-color:{$order.history.current.color}"
              >
                {$order.history.current.ostate_name}
              </span>
            </td>
            <td class="border-silver-my-account-history text-center p-5 border-b-2 border-t-2 border-l-2 border-r-2 text-sm-center hidden-md-down">
              {if $order.details.invoice_url}
                <a href="{$order.details.invoice_url}" class="m-auto">
                  <svg class="m-auto" id="Groupe_3034" data-name="Groupe 3034" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="37" height="47.439" viewBox="0 0 37 47.439">
                    <defs>
                      <clipPath id="clip-path">
                        <rect id="Rectangle_1970" data-name="Rectangle 1970" width="37" height="47.439" fill="none"/>
                      </clipPath>
                      <clipPath id="clip-path-3">
                        <rect id="Rectangle_1968" data-name="Rectangle 1968" width="12.729" height="9.557" fill="none"/>
                      </clipPath>
                    </defs>
                    <g id="Groupe_3030" data-name="Groupe 3030" clip-path="url(#clip-path)">
                      <g id="Groupe_3029" data-name="Groupe 3029" transform="translate(0 0)">
                        <g id="Groupe_3028" data-name="Groupe 3028" clip-path="url(#clip-path)">
                          <g id="Groupe_3027" data-name="Groupe 3027" transform="translate(23.108 1.301)" opacity="0.33">
                            <g id="Groupe_3026" data-name="Groupe 3026">
                              <g id="Groupe_3025" data-name="Groupe 3025" clip-path="url(#clip-path-3)">
                                <path id="Tracé_1652" data-name="Tracé 1652" d="M26.607,10.338,22.74,10.2l-5.135.142a3.534,3.534,0,0,1-3.727-3.3V.782H24.434a2.172,2.172,0,0,1,2.173,2.173Z" transform="translate(-13.877 -0.781)" fill="#00a193"/>
                              </g>
                            </g>
                          </g>
                          <path id="Tracé_1653" data-name="Tracé 1653" d="M34.491,47.439l-14.837-.31-17.143.31A2.514,2.514,0,0,1,0,44.93L.335,13.982,0,2.891A2.519,2.519,0,0,1,2.511.358L8.524.072C9.9.007,11.277-.012,12.645.007l21.86.351A2.509,2.509,0,0,1,37,2.866l-.42,29.159c-.02,1.382,0,2.769.058,4.153L37,44.9a2.519,2.519,0,0,1-2.509,2.543M11.63,1.605q-1.514,0-3.029.072l-6.051.286a.913.913,0,0,0-.942.9l-.6,8.527L1.96,33.222q.1,2.345-.012,4.691L1.607,44.94a.9.9,0,0,0,.9.894l8.471.32,23.509-.32a.9.9,0,0,0,.9-.9l-.361-8.686c-.058-1.414.341-3.955.361-5.369V2.856a.9.9,0,0,0-.9-.893L15.295,1.3c-.33,0-3.335.3-3.665.3" transform="translate(0 0)" fill="#00a193"/>
                          <path id="Tracé_1654" data-name="Tracé 1654" d="M30.229,20.409a.4.4,0,0,1-.4.4l-6.374-.263-14.344.488L5.131,20.8A6.87,6.87,0,0,0,.94,21.916l-.6.395V12.177L2.2,11.547A4.69,4.69,0,0,1,3.849,11.3l15.32.16,10.659-.186a.4.4,0,0,1,.4.4Z" transform="translate(0.225 7.501)" fill="#00a193"/>
                          <path id="Tracé_1655" data-name="Tracé 1655" d="M4.486,18.731a.222.222,0,0,1-.173-.07.226.226,0,0,1-.067-.172V12.22a.232.232,0,0,1,.067-.173.239.239,0,0,1,.173-.067H7.118a3.5,3.5,0,0,1,1.355.24,2.008,2.008,0,0,1,.9.728,2.165,2.165,0,0,1,.32,1.212,2.124,2.124,0,0,1-.32,1.209,1.94,1.94,0,0,1-.9.709,3.636,3.636,0,0,1-1.355.231H5.826v2.18a.236.236,0,0,1-.24.241ZM5.8,15.114H7.068a1.143,1.143,0,0,0,.771-.241.91.91,0,0,0,.271-.723.986.986,0,0,0-.245-.693,1.02,1.02,0,0,0-.8-.271H5.8Z" transform="translate(2.824 7.969)" fill="#fff"/>
                          <path id="Tracé_1656" data-name="Tracé 1656" d="M8.633,18.731a.227.227,0,0,1-.172-.07.218.218,0,0,1-.07-.173V12.218a.221.221,0,0,1,.07-.172.231.231,0,0,1,.172-.067h2.421a3.792,3.792,0,0,1,1.61.3,2.226,2.226,0,0,1,.989.889,2.925,2.925,0,0,1,.361,1.44c.007.283.008.531.008.744s0,.455-.008.731a3.278,3.278,0,0,1-.355,1.485,2,2,0,0,1-.967.873,3.861,3.861,0,0,1-1.589.286Zm1.294-1.244h1.127a1.885,1.885,0,0,0,.791-.145.942.942,0,0,0,.458-.458,1.94,1.94,0,0,0,.16-.816c.007-.185.01-.351.013-.5s0-.295,0-.443-.007-.31-.013-.493a1.485,1.485,0,0,0-.373-1.064,1.5,1.5,0,0,0-1.082-.341H9.927Z" transform="translate(5.582 7.969)" fill="#fff"/>
                          <path id="Tracé_1657" data-name="Tracé 1657" d="M13.024,18.731a.232.232,0,0,1-.173-.068.227.227,0,0,1-.068-.173V12.22a.227.227,0,0,1,.068-.173.244.244,0,0,1,.173-.067h4.3a.252.252,0,0,1,.177.067.238.238,0,0,1,.065.173v.823a.236.236,0,0,1-.065.172.245.245,0,0,1-.177.067H14.29v1.629h2.844a.247.247,0,0,1,.173.07.24.24,0,0,1,.068.173v.819a.228.228,0,0,1-.241.231H14.29v2.286a.235.235,0,0,1-.07.173.226.226,0,0,1-.172.068Z" transform="translate(8.503 7.969)" fill="#fff"/>
                          <path id="Tracé_1658" data-name="Tracé 1658" d="M11.431,28.131a.8.8,0,0,1-.8-.8l.148-1.715V20.986c-.148-.929.211-1.289.654-1.289a.8.8,0,0,1,.8.8l-.1,1.479.1,5.35a.8.8,0,0,1-.8.8" transform="translate(7.069 13.102)" fill="#00a193"/>
                          <path id="Tracé_1659" data-name="Tracé 1659" d="M15.615,24.021l-4.638.095-1.8-.095,2.806,2.806a.584.584,0,0,0,.826,0l1.286-1.48Z" transform="translate(6.104 15.978)" fill="#00a193"/>
                        </g>
                      </g>
                    </g>
                  </svg>
                </a>
              {else}
                -
              {/if}
            </td>
            <td class="border-silver-my-account-history text-center pt-5 pb-5 border-b-2 border-t-2 border-l-2 text-sm-center order-actions">
              <div class="pr-3 pl-3 flex justify-between items-center">
                <a 
                class="w-min border-b-2 border-primary text-lbg-primary text-sm inline-flex justify-center items-center space-x-2"
                href="{$order.details.details_url}" 
                data-link-action="view-order-details">
                  <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 14 14">
                    <g id="Groupe_2835" data-name="Groupe 2835" transform="translate(-1475.749 -560.5)">
                      <path id="Tracé_1487" data-name="Tracé 1487" d="M-7365-13073.5v12" transform="translate(8847.75 13635)" fill="none" stroke="#00A396" stroke-linecap="round" stroke-width="2"></path>
                      <path id="Tracé_1488" data-name="Tracé 1488" d="M0,0V12" transform="translate(1488.75 567.5) rotate(90)" fill="none" stroke="#00A396" stroke-linecap="round" stroke-width="2"></path>
                    </g>
                  </svg>
                  {l s='Details' d='Shop.Theme.Customeraccount'}
                </a>
                {if $order.details.reorder_url}
                  <a 
                  class="ml-3 px-1 py-2 border-2 text-lbg-primary border-primary rounded-sm text-sm inline-flex justify-center items-center space-x-2" 
                  href="{$order.details.reorder_url}">{l s='Reorder' d='Shop.Theme.Actions'}</a>
                {/if}
              </div>
            </td>
          </tr>
        {/foreach}
      </tbody>
    </table>

    <div class="hidden-md-up pt-10 md:pt-0 grid grid-cols-1 md:grid-cols-2 gap-3 md:gap-10 gap-x-20">
      {foreach from=$orders item=order}
        <div class="bg-gray-100 rounded-lg w-full px-4 pt-4 md:pt-3 pb-4 md:pb-6">
          <div class="">
            <div class="flex justify-between items-center mb-3">
              <a class="no-underline font-medium text-lg" href="{$order.details.details_url}"><p>Ref. #{$order.details.reference}</p></a>
              <a 
              class="w-min border-b-2 border-primary text-lbg-primary text-sm inline-flex justify-center items-center space-x-2"
              href="{$order.details.details_url}" 
              data-link-action="view-order-details">
                <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 14 14">
                  <g id="Groupe_2835" data-name="Groupe 2835" transform="translate(-1475.749 -560.5)">
                    <path id="Tracé_1487" data-name="Tracé 1487" d="M-7365-13073.5v12" transform="translate(8847.75 13635)" fill="none" stroke="#00A396" stroke-linecap="round" stroke-width="2"></path>
                    <path id="Tracé_1488" data-name="Tracé 1488" d="M0,0V12" transform="translate(1488.75 567.5) rotate(90)" fill="none" stroke="#00A396" stroke-linecap="round" stroke-width="2"></path>
                  </g>
                </svg>
                {l s='Details' d='Shop.Theme.Customeraccount'}
              </a>
            </div>
            <div class="date">{$order.details.order_date}</div>
            <div class="payment">{$order.details.payment}</div>
            <div class="total">{$order.totals.total.value}</div>
            <div class="status flex">
              <span
              class="inline-block p-3 rounded {$order.history.current.contrast}"
              style="background-color:{$order.history.current.color}">
                {$order.history.current.ostate_name}
              </span>
            </div>
          </div>
            {* <div class="">
                <div>
                  <a href="{$order.details.details_url}" data-link-action="view-order-details" title="{l s='Details' d='Shop.Theme.Customeraccount'}">
                    <i class="material-icons">&#xE8B6;</i>
                  </a>
                </div>
                {if $order.details.reorder_url}
                  <div>
                    <a href="{$order.details.reorder_url}" title="{l s='Reorder' d='Shop.Theme.Actions'}">
                      <i class="material-icons">&#xE863;</i>
                    </a>
                  </div>
                {/if}
            </div> *}
          {* </div> *}
        </div>
      {/foreach}
    </div>

  {/if}
{/block}
