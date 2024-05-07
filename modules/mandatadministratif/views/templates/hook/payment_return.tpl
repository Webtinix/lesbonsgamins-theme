<p>{l s='You have chosen to pay by administrative mandate. This type of payment is reserved for administrations.' mod='mandatadministratif'}</p>
{* <p>{l s='Send us your purchase order with mention "good for agreement".' mod='mandatadministratif'}</p> *}
<p>
{l
    s='Nous sommes désormais dans l\'attente de votre mandat administratif. Votre commande sera envoyée à réception de celui-ci. [1][2]www.lesbonsgamins.com/img/cms/Téléchargement/mandat_administratif_LesBonsGamins.pdf[/2]lien mandat[/1]'
    d='Shop.Theme.Catalog'
    sprintf=[
    '[1]' => "<a class='underline' href",
    '[2]' => "='",
    '[/2]' => "'>",
    '[/1]' => "</a>"
    ]
}
</p>
<hr>
<p>{l s='You must send this document to :' mod='mandatadministratif'}</p>
<p>{$company_name}</p>
<p>{$company_address}</p>