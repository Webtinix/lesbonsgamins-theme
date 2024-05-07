{**
 * 2007-2020 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2020 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file='customer/my-account.tpl'}

{block name='wx_menu_page_title'}
  {l s='Mes Favoris' d='Shop.Theme.Checkout'}
{/block}

{block name='wx_container_menu_items'}
  
  {assign var="wishlish_products" value=$wx_customshop->getMyWishlist()}
  {if not empty($wishlish_products) }
    <div class="grid grid-cols-2 md:grid-cols-3 gap-4" id="wishlistContainer">
    {foreach from=$wishlish_products item="product" key="position"}
        {include file="catalog/_partials/miniatures/product.tpl" product=$product position=$position productClasses="favoris col-xs-6 col-xl-3"}
    {/foreach}
    </div>
  {else}
    <div class="p-4 border rounded">
      <p class="mb-0">{l s='Il n’y a pas de favoris pour le moment.' d='Shop.Theme.Checkout'}</p>
    </div>
  {/if}

{/block}

