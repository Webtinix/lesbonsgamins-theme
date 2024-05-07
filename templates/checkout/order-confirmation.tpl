{extends file='page.tpl'}

{block name='page_content_container' prepend}
  <section id="content-hook_order_confirmation" class="w-full mx-auto p-4" style="max-width: 85rem;">

    <script>
      jQuery( document ).ready(function() {
        var refernce_id = $("div.p-4.border .refrence_id-product1").text().trim();
        var product_price_total = $("table.border tbody tr.total-value.font-weight-bold td:nth-child(2)").text();
        var transactionProducts = [];
        jQuery('.text-base tr.border-t').each(function(index, element) {
          var productName = $(this).find('.details span').text().trim();
          var productPrice = $(this).find('.p-4.text-center.border-r').eq(0).text().trim();

          var product = {
            'name': productName,
            'price': productPrice,
            
          };
          
          transactionProducts.push(product);
        });

        dataLayer.push({
          
          'event': 'purchase',
          'action': 'ecommerce',
          'transactionId': refernce_id,
          'transactionTotal': product_price_total,
          'transactionProducts': transactionProducts,
          
        });

        gtag('event', 'purchase', {
                    'transaction_id': refernce_id, 
                    'value': product_price_total, 
                    'currency': EUR,
                  });

        }
    );
    </script>

    <div class="card-block">
      <div class="flex">
        <div class="w-full">
          {* <pre>
              {$order|@var_dump}
            </pre> *}
          {block name='order_confirmation_header'}
            <div class="flex flex-col md:flex-row md:space-x-3 md:items-center mb-8">
              <div>
                <img class="h-20 md:h-28" src="{$urls.img_url}Félicitation@4x.png" />
              </div>
              <div class="flex-1 mt-2 md:mt-0">
                <h1 class="text-2xl md:text-3xl font-medium">
                  {* {l s='Trop chouette, votre commande N°%reference% est confirmée. %br% Elle arrivera dans quelques jours' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference, '%br%' => '<br class="hidden md:block">']}                     *}
                  {l s='Suivi de votre commande N°%reference%' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference, '%br%' => '<br class="hidden md:block">']}
                </h1>
                <p class="mt-8 md:mt-1">
                  {l s='Un e-mail de confirmation vous a été envoyé à l’adresse %email%' d='Shop.Theme.Checkout' sprintf=['%email%' => $customer.email]}
                </p>
              </div>
            </div>
          {/block}

          <div class="flex flex-col md:flex-row space-y-6 md:space-y-0 md:space-x-8 relative mb-6"
            x-data="{ formIsOpen: false }">
            <p class="flex-1">
              {if $customer.is_guest}
              {* {l s='An email has been sent to your mail address %email%.' d='Shop.Theme.Checkout' sprintf=['%email%' => $customer.email]}
                {else} *}
                {l s='Pour retrouver plus facilement vos commandes, vos factures et vos avantages, vous pouvez définir un mot de passe pour créer votre espace client.' d='Shop.Theme.Checkout'}
              {/if}
              {if $order.details.invoice_url}
                {* [1][/1] is for a HTML tag. *}
                {l
                                                            s='You can also [1]download your invoice[/1]'
                                                            d='Shop.Theme.Checkout'
                                                            sprintf=[
                                                              '[1]' => "<a href='{$order.details.invoice_url}'>",
                '[/1]' => "</a>"
                ]
                }
              {/if}
            </p>
            {block name='customer_registration_form'}
              <div class="w-full md:w-1/3 relative">
                {if $customer.is_guest} 
                  <button @click="formIsOpen = !formIsOpen"
                    class="border w-full text-center bg-lbg-primary hover:bg-primary hover:text-white text-white border-primary rounded text-sm px-8 py-2 focus:outline-none"
                    data-link-action="display-register-form">
                    Choisir un mot de passe
                  </button>

                  <form action="{$urls.pages.authentication}?back=identity" id="customer-form"
                    class="_form_choisir_mdp js-customer-form" method="post">
                    {assign var="register" value=true}
                    <input type="hidden" name="submitCreate" value="1">
                    <input type="hidden" name="email" value="{$customer.email}">
                    <input type="hidden" name="lastname" value="{$order.addresses.delivery.lastname}">
                    <input type="hidden" name="firstname" value="{$order.addresses.delivery.firstname}">
                    <div x-show="formIsOpen" class="mb-4 mt-6 w-full" x-cloak>
                      <div class="flex gap-2 mb-4" x-data="{ showPassword_: false }">
                        <div class="relative flex-1">
                          <input 
                            x-bind:type="showPassword_ ? 'text' : 'password'" name="password"
                            class="input_pass_valider_form_choisir_mdp w-full border-0 border-b border-gray-800 py-2 text-sm"
                            placeholder="Inscrivez votre mot de passe" 
                          />
                          <span @click="showPassword_ = !showPassword_" class="absolute h-7 w-7 right-0 bottom-0">
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

                        <div class="">
                          <button data-link-action="save-customer" type="submit"
                            class="button_valider_form_choisir_mdp py-2 text-sm px-6 text-white bg-lbg-primary rounded hover:bg-primary bg-lbg-primary">
                            Valider
                          </button>
                        </div>
                      </div>
                      <span class="text_mdp_non_valide_form_choisir_mdp hidden text-red-500 text-xs "></span>
                      <p class="text-sm md:w-10/12">Le mot de passe doit contenir au moins 8 caractères, 1 minuscule, 1 majuscule, 1 chiffre et 1 caractère spécial.</p>
                    </div>
                  </form>
                {/if}
              </div>
            {/block}
          </div>

          {block name='hook_order_confirmation'}
            {$HOOK_ORDER_CONFIRMATION nofilter}
          {/block}

        </div>
      </div>
    </div>
  </section>
{/block}

{block name='page_content_container'}
  <div class="w-full mx-auto" style="max-width: 85rem;">
    <section id="content" class="page-content page-order-confirmation px-4">
      <h2 class="text-2xl font-medium mb-8">
        {l s='Récapitulatif de votre commande N°%reference%' d='Shop.Theme.Checkout' sprintf=['%reference%' => $order.details.reference]}
      </h2>
      <div class="card-block">
        <div class="">

          <div class="flex flex-col md:flex-row justify-between gap-8">
            {block name='order_confirmation_table'}
              {include
                                                        file='checkout/_partials/order-confirmation-table.tpl'
                                                        products=$order.products
                                                        subtotals=$order.subtotals
                                                        totals=$order.totals
                                                        labels=$order.labels
                                                        add_product_link=false
                                                      }
            {/block}

            <div class="w-full max-w-sm flex flex-col space-y-10">
              <div class="">
                <div class="w-full border-b-2 border-gray-500 mb-3">
                  <h3 class="text-xl font-medium pb-2">Adresse de livraison</h3>
                </div>
                <p class="text-lg">{$order.addresses.delivery.alias}</p>
                <p class="text-sm">{$order.addresses.delivery.formatted nofilter}</p>
              </div>
              <div class="">
                <div class="w-full border-b-2 border-gray-500 mb-3">
                  <h3 class="text-xl font-medium pb-2">Adresse de Facturation</h3>
                </div>
                <p class="text-lg">{$order.addresses.invoice.alias}</p>
                <p class="text-sm">{$order.addresses.invoice.formatted nofilter}</p>
              </div>
              <div class="">
                <div class="w-full border-b-2 border-gray-500 mb-3">
                  <h3 class="text-xl font-medium pb-2">Mode de livraison</h3>
                </div>
                <p class="text-sm">{$order.carrier.name}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    {block name='hook_payment_return'}
      {if ! empty($HOOK_PAYMENT_RETURN)}
        <section id="content-hook_payment_return"
          class="definition-list w-full flex flex-col md:flex-row justify-between pb-12 md:pb-28">
          <div class="w-full max-w-3xl px-4">
            <div class="w-full border-b-2 border-gray-500 mb-3">
              <h3 class="text-xl font-medium pb-2">Moyen de paiement</h3>
            </div>
            <p>{$order.details.payment}</p>
            <div class="card-block">
              <div class="row">
                <div class="col-md-12">
                  {$HOOK_PAYMENT_RETURN nofilter}
                </div>
              </div>
            </div>
          </div>
          <div class="w-full md:max-w-md mt-10 md:mt-20 md:px-4">
            <div class="rounded-lg bg-gray-100 px-4 py-6 md:p-10">
              <h2 class="text-2xl font-medium mb-3">Informations complémentaires</h2>
              <p class="text-sm">
                {l
                                                                            s='Veuillez préciser votre numéro de commande n°%reference% dans la description du virement. 
                  Nous vous avons également envoyé ces informations par email. %br%%br% 
                  Votre commande sera expédiée dès réception de votre virement. %br%%br% 
                  Si vous avez des questions ou des commentaires, n\'hésitez pas à contacter notre service client.
                '
                                                                            d='Shop.Theme.Checkout'
                                                                            sprintf=[
                                                                              '%reference%' => $order.details.reference,
                                                                              '%br%' => '<br/>'
                                                                            ]
                                                                          }
              </p>
            </div>
          </div>
        </section>
      {/if}
    {/block}

    {* {block name='customer_registration_form'}










      {if $customer.is_guest}
                                                                    <div id="registration-form" class="card">
                                                                      <div class="card-block">
                                                                        <h4 class="h4">









        {l s='Save time on your next order, sign up now' d='Shop.Theme.Checkout'}</h4>










        {render file='customer/_partials/customer-form.tpl' ui=$register_form}
                                                                      </div>
                                                                    </div>










      {/if}










    {/block} *}

    {block name='hook_order_confirmation_1'}
      {hook h='displayOrderConfirmation1'}
    {/block}

    {* {block name='hook_order_confirmation_2'}
      <section id="content-hook-order-confirmation-footer">
        {hook h='displayOrderConfirmation2'}
      </section>
    {/block} *}
  </div>
{/block}