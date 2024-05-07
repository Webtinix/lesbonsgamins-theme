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

{if isset($notifications) && (!empty($notifications.error) || !empty($notifications.warning) || !empty($notifications.success) || !empty($notifications.info))}
{assign var="isCheckout" value=false}
{if $page.page_name == 'checkout'}
  {assign var="isCheckout" value=true}
{/if}
<aside id="notifications" class="w-full h-auto {if $isCheckout}-mt-10 mb-10{/if}">
  <div class="mx-auto px-2 md:px-4" style="max-width: 85rem;">
    {if $notifications.error}
      {assign var='errorNotifs' value=array_unique($notifications.error)}
      {block name='notifications_error'}
        <article class="alert alert-danger" role="alert" data-alert="danger">
          <ul>
            {foreach $errorNotifs as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {if $notifications.warning}
      {assign var='warningNotifs' value=array_unique($notifications.warning)}
      {block name='notifications_warning'}
        <article class="alert alert-warning" role="alert" data-alert="warning">
          <ul>
            {foreach $warningNotifs as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {if $notifications.success}
      {assign var='successNotifs' value=array_unique($notifications.success)}
      {block name='notifications_success'}
        <article class="alert alert-success" role="alert" data-alert="success">
          <ul>
            {foreach $successNotifs as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}

    {if $notifications.info}
      {assign var='infoNotifs' value=array_unique($notifications.info)}
      {block name='notifications_info'}
        <article class="alert alert-info" role="alert" data-alert="info">
          <ul>
            {foreach $infoNotifs as $notif}
              <li>{$notif nofilter}</li>
            {/foreach}
          </ul>
        </article>
      {/block}
    {/if}
  </div>
</aside>
{/if}
