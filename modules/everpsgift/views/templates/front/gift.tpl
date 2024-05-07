{*
* Project : everpsgift
* @author Team EVER
* @copyright Team EVER
* @license   Tous droits réservés / Le droit d'auteur s'applique (All rights reserved / French copyright law applies)
* @link https://www.team-ever.com
*}

{* {extends file='customer/page.tpl'} *}
{extends file='customer/my-account.tpl'}

{block name='wx_menu_page_title'}
    {l s='Mes cartes cadeaux' d='Shop.Theme.Customeraccount'}
{/block}

{block name="wx_container_menu_items"}
    {* {$giftsList|dump} *}
    {if $giftsList}
        {* 
            <div class="container px-0">
                <div class="description_gift_list">
                    <p>{l s='Here is a list of all your gifts.' mod='everpsgift'}</p>
                    <p>{l s='You can order whenever on our website.' mod='everpsgift'}</p>
                    <p>{l s='Feel free to contact us at' mod='everpsgift'} <a href="mailto:{$shop_email|escape:'htmlall':'UTF-8'}" rel="nofollow">{$shop_email|escape:'htmlall':'UTF-8'}</a></p>
                </div>
            </div> 
        *}

        {* 
        <div class="w-screen h-screen fixed top-0 right-0">
            <div class="w-full h-full flex justify-center items-center">
                <div class="shadow-md bg-gray-50 p-5 rounded-lg">
                    <div class="px-0 mb-2 md:mb-0 col-md-7 w-full md:w-auto md:pr-2">
                        <input type="email" name="gifted" class="w-full gifted py-2.5 px-3">
                    </div>
                    <button 
                        class="col-md-5 w-full md:w-auto lbg-btn primary-btn-full py-3" 
                        id="validate_thread" 
                        type="button" 
                        name="validate_thread" 
                        data-gift="" 
                        data-url="{$link->getModuleLink('everpsgift', 'ajaxAddThread')|escape:'htmlall':'UTF-8'}">
                        {l s='Send mail' mod='everpsgift'}
                    </button>
                    <div class="mb-0 col-xs-12 product-line-info alert alert-success thread-success nodisplay">
                        {l s='Message successfully sent' mod='everpsgift'}
                    </div>
                    <div class="mb-0 col-xs-12 product-line-info alert alert-warning thread-error nodisplay">
                        {l s='An error has occured' mod='everpsgift'}
                    </div>
                </div>
            </div>
        </div> 
    *}

        <div class="" id="evergifts">
            <table class="mt-7 table table-labeled hidden-sm-down">
                <thead class="">
                    <tr>
                        <th class="border-gray-500 text-center font-normal p-2 border-r-2">{l s='Référence' mod='everpsgift'}
                        </th>
                        <th class="border-gray-500 text-center font-normal p-2 border-r-2">{l s='Date d’achat' mod='everpsgift'}
                        </th>
                        <th class="border-gray-500 text-center font-normal p-2 border-r-2">{l s='Montant' mod='everpsgift'}</th>
                        {* <th class="border-gray-500 text-center font-normal p-2 border-r-2">{l s='Paiement' mod='everpsgift'}</th> *}
                        <th class="border-gray-500 text-center font-normal p-2 border-r-2">
                            {l s='Date d’expiration' mod='everpsgift'}</th>
                        <th class="w-5/12 border-gray-500 text-center font-normal p-2 border-r-2">
                            {l s='Carte offerte à' mod='everpsgift'}</th>
                        <th class="border-gray-500 text-center font-normal p-2 border-l-2">{l s='Statut' mod='everpsgift'}</th>
                        {* <th class="py-3 px-4 border font-medium">{l s='Friend email' mod='everpsgift'}</th>
                    <th class="py-3 px-4 border font-medium">{l s='Montant' mod='everpsgift'}</th>
                    <th class="py-3 px-4 border font-medium whitespace-nowrap">{l s='Gift code' mod='everpsgift'}</th>
                    <th class="py-3 px-4 border font-medium">{l s='Etat e-mail' mod='everpsgift'}</th> *}
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$giftsList item=value}
                        {assign var="order" value=$wx_customshop->getOrderLazyArrayNew($value.id_order)}
                        {assign var="date_add" value=$wx_customshop->getDateAddOrderById($value.id_order)}
                        {assign var="date_expiration" value=$wx_customshop->getGiftDateExpiration($date_add, $value.validity_duration, $language.date_format_lite)}
                        {assign var="date_expiration_english" value=$wx_customshop->getGiftDateExpiration($date_add, $value.validity_duration)}
                        <tr>
                            <td class="text-left border-gray-500 font-normal p-5 px-0 border-b-2 border-t-2 border-r-2 details-{$value.id_everpsgift|escape:'htmlall':'UTF-8'}"
                                id="id_everpsgift">
                                #{$order.details.reference}
                            </td>
                            <td class="text-center border-gray-500 font-normal p-5 px-0 border-b-2 border-t-2 border-r-2 details-{$value.id_everpsgift|escape:'htmlall':'UTF-8'}"
                                id="id_everpsgift">
                                {$order.details.order_date}
                            </td>
                            <td class="text-center border-gray-500 font-normal p-5 px-0 border-b-2 border-t-2 border-r-2 details-{$value.id_everpsgift|escape:'htmlall':'UTF-8'}"
                                id="id_everpsgift">
                                {Tools::displayPrice($value.amount)|escape:'htmlall':'UTF-8'}
                            </td>
                            {* <td class="text-center border-gray-500 font-normal p-5 px-0 border-b-2 border-t-2 border-r-2 details-{$value.id_everpsgift|escape:'htmlall':'UTF-8'}" id="id_everpsgift">
                    {$order.details.payment}
                </td> *}
                            <td class="text-center border-gray-500 font-normal p-5 px-0 border-b-2 border-t-2 border-r-2 details-{$value.id_everpsgift|escape:'htmlall':'UTF-8'}"
                                id="id_everpsgift">
                                {$date_expiration}
                            </td>
                            <td class="text-center border-gray-500 font-normal p-5 px-0 border-b-2 border-t-2 border-r-2 details-{$value.id_everpsgift|escape:'htmlall':'UTF-8'}"
                                id="thread">

                                {if $wx_customshop->compareDate('', $date_expiration_english) > 0}
                                    <div class="w-full text-center">-</div>
                                {else}
                                    {if $value.mail_sent == 1}
                                        <div class="px-1 w-full text-center flex items-center justify-center">
                                            <span>{$value.email|escape:'htmlall':'UTF-8'}</span>
                                        </div>
                                        {* <div class="px-1 mb-2 md:mb-0 col-md-7 w-full md:w-auto md:pr-2 flex items-center pt-3">
                            {$value.email|escape:'htmlall':'UTF-8'}
                        </div>
                        <button 
                            class="col-md-5 lbg-btn primary-btn-full py-3" 
                            id="resend_thread" 
                            type="button" 
                            name="resend_thread" 
                            data-gift="{$value.id_everpsgift|escape:'htmlall':'UTF-8'}" 
                            data-url="{$link->getModuleLink('everpsgift', 'ajaxAddThread')|escape:'htmlall':'UTF-8'}" 
                            data-gifted="{$value.email|escape:'htmlall':'UTF-8'}">{l s='Re-send mail' mod='everpsgift'}
                        </button>
                        <div class="mb-0 col-xs-12 product-line-info alert alert-success thread-success nodisplay">
                            {l s='Message successfully sent' mod='everpsgift'}
                        </div> *}
                                    {else}
                                        <div x-data="{ open: false }" class="w-full">
                                            <div x-show="!open" class="w-full text-center flex items-center justify-center">
                                                <button @click="open = ! open"
                                                    class="rounded bg-lbg-primary text-white md:px-5 lg:px-10 py-3">{l s='Offrir la carte' mod='everpsgift'}</button>
                                            </div>
                                            <div x-cloak x-show="open" class="w-full flex-col text-center" :class="{ 'flex': open }">
                                                <div class="w-full flex-wrap flex gap-2 px-3">
                                                    <div class="flex-1 flex items-center justify-center lg:pr-5">
                                                        <input placeholder="{l s='Entrer l\'e-mail du destinataire' mod='everpsgift'}"
                                                            type="email" name="gifted"
                                                            class="border-b-2 h-full border-gray-500 w-full gifted py-1 px-1">
                                                    </div>
                                                    <button class="md:w-full lg:w-auto rounded bg-lbg-primary text-white px-3 py-3"
                                                        id="validate_thread" type="button" name="validate_thread"
                                                        data-gift="{$value.id_everpsgift|escape:'htmlall':'UTF-8'}"
                                                        data-url="{$link->getModuleLink('everpsgift', 'ajaxAddThread')|escape:'htmlall':'UTF-8'}">
                                                        {l s='Envoyer' mod='everpsgift'}
                                                    </button>
                                                    <div class="w-full mb-0 product-line-info alert alert-success thread-success nodisplay">
                                                        {l s='Message successfully sent' mod='everpsgift'}
                                                    </div>
                                                    <div class="w-full mb-0 product-line-info alert alert-warning thread-error nodisplay">
                                                        {l s='An error has occured' mod='everpsgift'}
                                                    </div>
                                                </div>
                                                {* <div class="w-full">
                                    <div class="mb-0 col-xs-12 product-line-info alert alert-success thread-success nodisplay">
                                        {l s='Message successfully sent' mod='everpsgift'}
                                    </div>
                                    <div class="mb-0 col-xs-12 product-line-info alert alert-warning thread-error nodisplay">
                                        {l s='An error has occured' mod='everpsgift'}
                                    </div>
                                </div> *}
                                            </div>
                                        </div>
                                    {/if}
                                {/if}

                                {* <div class="px-1 mb-2 md:mb-0 col-md-7 w-full md:w-auto md:pr-2 flex items-center pt-3">
                                    {$value.email|escape:'htmlall':'UTF-8'}
                                </div> *}
                            </td>
                            <td class="text-center border-gray-500 font-normal p-5 border-b-2 border-t-2 border-l-2 details-{$value.id_everpsgift|escape:'htmlall':'UTF-8'}"
                                id="valid">
                                {if $wx_customshop->compareDate('', $date_expiration_english) > 0}
                                    <div class="rounded gift-expired p-3">
                                        {l s='Expiré' mod='everpsgift'}
                                    </div>
                                {else}
                                    {if $value.mail_sent == 1}
                                        <div class="rounded gift-sent p-3">
                                            {l s='Offert' mod='everpsgift'}
                                        </div>
                                    {else}
                                        <div class="rounded gift-not-sent p-3">
                                            {l s='A envoyer' mod='everpsgift'}
                                        </div>
                                    {/if}
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
            <div class="hidden-md-up">
                {foreach from=$giftsList item=value}
                    <div class="pt-10 md:pt-0 grid grid-cols-1 md:grid-cols-2 gap-3 md:gap-10 gap-x-20">
                        <article id="gift-{$value.id_everpsgift|escape:'htmlall':'UTF-8'}"
                            class="bg-gray-100 rounded-lg w-full pt-4 md:pt-3 pb-4 md:pb-6">
                            <div class="h-full pl-4 md:pl-10 pr-4 flex flex-col justify-between">
                                <span>
                                    Ref. #{$order.details.reference}
                                </span>
                                <span>
                                    Date d’achat : {$order.details.order_date}
                                </span>
                                <span>
                                    Date d’expiration : {$date_expiration}
                                </span>
                                <span>
                                    {$order.details.payment}
                                </span>
                                <span>
                                    {Tools::displayPrice($value.amount)|escape:'htmlall':'UTF-8'}
                                </span>
                                <span class="mt-3">
                                    {if $wx_customshop->compareDate('', $date_expiration_english) > 0}
                                        <div class="w-full">-</div>
                                    {else}
                                        {if $value.mail_sent == 1}
                                            {* <div class="px-1 w-full">
                                                <span>{$value.email|escape:'htmlall':'UTF-8'}</span>
                                            </div> *}
                                            <div x-show="!open">
                                                <button @click="open = ! open"
                                                    class="rounded wx_btn_bg_gray gift-sent px-10 md:px-5 lg:px-10 py-2 disabled sm:text-black">{l s='Carte offerte' mod='everpsgift'}</button>
                                            </div>
                                        {else}
                                            <div x-data="{ open: false }" class="w-full">
                                                <div x-show="!open">
                                                    <button @click="open = ! open"
                                                        class="rounded md:bg-lbg-primary md:text-white px-10 md:px-5 lg:px-10 py-2 bg-white border-2 border-primary sm:text-primary ">{l s='Offrir la carte cadeau' mod='everpsgift'}</button>
                                                </div>
                                                <div x-cloak x-show="open" class="w-full flex-col text-center" :class="{ 'flex': open }">
                                                    <div class="w-full flex-wrap flex gap-2 px-3">
                                                        <div class="flex-1 flex items-center justify-center lg:pr-5">
                                                            <input placeholder="{l s='Entrer l\'e-mail du destinataire' mod='everpsgift'}"
                                                                type="email" name="gifted"
                                                                class="border-b-2 h-full border-gray-500 w-full gifted py-1 px-1">
                                                        </div>
                                                        <button class="md:w-full lg:w-auto rounded bg-lbg-primary text-white px-3 py-3"
                                                            id="validate_thread" type="button" name="validate_thread"
                                                            data-gift="{$value.id_everpsgift|escape:'htmlall':'UTF-8'}"
                                                            data-url="{$link->getModuleLink('everpsgift', 'ajaxAddThread')|escape:'htmlall':'UTF-8'}">
                                                            {l s='Envoyer' mod='everpsgift'}
                                                        </button>
                                                        <div
                                                            class="w-full mb-0 product-line-info alert alert-success thread-success nodisplay">
                                                            {l s='Message successfully sent' mod='everpsgift'}
                                                        </div>
                                                        <div
                                                            class="w-full mb-0 product-line-info alert alert-warning thread-error nodisplay">
                                                            {l s='An error has occured' mod='everpsgift'}
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        {/if}
                                    {/if}
                                </span>
                            </div>
                        </article>
                    </div>
                {/foreach}
            </div>
        </div>
    {else}
        <div class="p-4 border rounded">
            <p class="mb-0">{l s='There\'s no gifts on your account. Feel free to ask some support !' mod='everpsgift'}</p>
        </div>
    {/if}
    <script>
        $('#validate_thread').on('click', function() {
            setTimeout(() => {
                location.reload();
            }, 1000);
        })
    </script>
{/block}