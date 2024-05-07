<!-- Le template doit ếtendre le template parent des étapes du tunnel de commande -->
{extends file='checkout/_partials/steps/checkout-step.tpl'}

{*assign var="show_title" value=true*}
{*assign var="show_content" value=true*}
 
<!-- Le contenu doit doit être dans le block step content -->
{block name='step_content'}
    <div class="custom-checkout-step">
        <h2>Entrez votre adresse e-mail pour poursuivre la commande</h2>
        <!-- Le formulaire doit envoyer les données sur la page de commande en post -->
        <form
                method="POST"
                action="{$urls.pages.order}"
                data-refresh-url="{url entity='order' params=['ajax' => 1, 'action' => 'customStep']}"
        >
 
            <!-- Les Champs spécifiques de la step avec assignation de la variable si elle existe -->
            <section class="form-fields">
                <div class="form-group row">
                    <label class="col-md-3 form-control-label required">Adresse Email</label>
                    <div class="col-md-6">
                        <input type="text" name="checkout_custom_step_email" {if isset($serviceName)}value="{$serviceName}"{/if}/>
                    </div>
                </div>
            </section>
            <footer class="form-footer clearfix">
                <input type="submit" name="submitCustomStep" value="Envoyer"
                       class="btn btn-primary continue float-xs-right"/>
            </footer>
        </form>
    </div>
{/block}