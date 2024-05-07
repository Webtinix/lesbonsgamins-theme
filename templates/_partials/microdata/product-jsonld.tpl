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
{assign var=hasAggregateRating value=false}
{if !empty($product.productComments.averageRating) && !empty($product.productComments.nbComments)}
    {assign var=hasAggregateRating value=true}
    {assign var=ratingValue value=$product.productComments.averageRating}
    {assign var=ratingReviewCount value=$product.productComments.nbComments}
{/if}
{if !empty($ratings.avg) && !empty($nbComments)}
    {assign var=hasAggregateRating value=true}
    {assign var=ratingValue value=$ratings.avg}
    {assign var=ratingReviewCount value=$nbComments}
{/if}
{assign var=hasWeight value=false}
{if isset($product.weight) && ($product.weight != 0)}
    {assign var=hasWeight value=true}
{/if}
{assign var=hasOffers value=$product.show_price}


{* Assign by Webtinix *}
{assign var="nom_expert" value=$wx_customshop->get_acf_value('NOM_EXPERT', $product.id)}
{assign var="url_photo_expert" value=$wx_customshop->get_acf_value('PHOTO_EXPERT', $product.id)}
{assign var="question_expert" value=$wx_customshop->get_acf_value('QUESTION_EXPERT', $product.id)}
{assign var="parole_expert" value=$wx_customshop->get_acf_value('PAROLE_EXPERT', $product.id)}
{assign var="libele_btn_expert" value=$wx_customshop->get_acf_value('Libelle_bouton', $product.id)}
{assign var="lien_btn_expert" value=$wx_customshop->get_acf_value('Lien_bouton', $product.id)}
{assign var="product_rate" value=$wx_customshop->get_SAG_product_rate($product.id_product)}
{assign var="product_reviews" value=$wx_customshop->get_SAG_product_reviews($product.id_product)}

{if $parole_expert}
<script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "QAPage",
    "mainEntity": {
      "@type": "Question",
      "name": "{$nom_expert nofilter}",
      "text": "{$question_expert nofilter}",
      "answerCount": "1",
      "suggestedAnswer": [
        {
          "@type": "Answer",
          "text": "{$parole_expert nofilter}",
          "url": "{$product.url}",
          "upvoteCount": "1"
        }
      ]
    }
  }
</script>
{/if}
<script type="application/ld+json">
  {
    "@context": "https://schema.org/",
	"@id": "product",
    "@type": "Product",
    "name": "{$product.name}",
    "itemCondition": "https://schema.org/NewCondition",
    "description": "{$page.meta.description|regex_replace:"/[\r\n]/" : " "}",
    "category": "{$product.category_name}",
    {if !empty($product.cover)}"image" :"{$product.cover.bySize.home_default.url}",{/if}
    "sku": "{if $product.reference}{$product.reference}{else}{$product.id}{/if}",
    "mpn": "{if $product.mpn}{$product.mpn}{elseif $product.reference}{$product.reference}{else}{$product.id}{/if}"
    {if $product.ean13},"gtin13": "{$product.ean13}"
    {else if $product.upc},"gtin13": "{$product.upc}"
    {/if}
    ,
    
    {if count($product_reviews) > 0}
    "aggregateRating": {
      "@type": "AggregateRating",
      "ratingValue": "{$product_rate['rate']}",
      "reviewCount": "{count($product_reviews)}",
      "worstRating": "0",
      "bestRating": "5"
    }
    ,{/if}
    {if $product_manufacturer->name OR $shop.name}
    "brand": {
      "@type": "Brand",
      "name": "{if $product_manufacturer->name}{$product_manufacturer->name|escape:'html':'UTF-8'}{else}{$shop.name}{/if}"
    }
    {/if}
    {if $hasAggregateRating and $ratingReviewCount > 0},
    "aggregateRating": {
      "@type": "AggregateRating",
      "ratingValue": "{$ratingValue|round:1|escape:'html':'UTF-8'}",
      "reviewCount": "{$ratingReviewCount|escape:'html':'UTF-8'}"
    }
    {/if}
    {if $hasWeight},
    "weight": {
        "@context": "https://schema.org",
        "@type": "QuantitativeValue",
        "value": "{$product.weight}",
        "unitCode": "{$product.weight_unit}"
    }
    {/if}
    {if $hasOffers},
    "offers": {
      "@type": "Offer",
      "priceCurrency": "{$currency.iso_code}",
      "name": "{$product.name|strip_tags:false}",
      "price": "{$product.price_amount}",
      "url": "{$product.url}",
      "priceValidUntil": "{($smarty.now + (int) (60*60*24*15))|date_format:"%Y-%m-%d"}",
      {if $product.images|count > 0}
        "image": {strip}[
          {foreach from=$product.images item=p_img name="p_img_list"}
            "{$p_img.large.url}"{if not $smarty.foreach.p_img_list.last},{/if}
          {/foreach}
        ]{/strip},
      {/if}

      "shippingDetails": {
        "@type": "OfferShippingDetails",
        "shippingRate": {
          "@type": "MonetaryAmount",
          "value": 6,
          "currency": "{$currency.iso_code}"
        },
        "shippingDestination": {
          "@type": "DefinedRegion",
          "addressCountry": "FR"
        },
        "deliveryTime": {
          "@type": "ShippingDeliveryTime",
          "handlingTime": {
            "@type": "QuantitativeValue",
            "minValue": 1,
            "maxValue": 3,
            "unitCode": "DAY"
          },
          "transitTime": {
            "@type": "QuantitativeValue",
            "minValue": 2,
            "maxValue": 5,
            "unitCode": "DAY"
          }
        }
      },
      "hasMerchantReturnPolicy": {
        "@type": "MerchantReturnPolicy",
        "applicableCountry": "FR",
        "returnPolicyCategory": "https://schema.org/MerchantReturnFiniteReturnWindow",
        "merchantReturnDays": 14,
        "returnMethod": "https://schema.org/ReturnByMail",
        "returnFees": "https://schema.org/FreeReturn"
      },
      
      "sku": "{if $product.reference}{$product.reference}{else}{$product.id}{/if}",
      "mpn": "{if $product.mpn}{$product.mpn}{elseif $product.reference}{$product.reference}{else}{$product.id}{/if}",
      {if $product.ean13}"gtin13": "{$product.ean13}",{else if $product.upc}"gtin13": "0{$product.upc}",{/if}
      {if $product.condition == 'new'}"itemCondition": "https://schema.org/NewCondition",{/if}
      {if $product.show_condition > 0}
        {if $product.condition == 'used'}"itemCondition": "https://schema.org/UsedCondition",{/if}
        {if $product.condition == 'refurbished'}"itemCondition": "https://schema.org/RefurbishedCondition",{/if}
      {/if}
      "availability": "{$product.seo_availability}",
      "seller": {
        "@type": "Organization",
        "name": "{$shop.name}"
      }
      {*if $product.price_amount > 49}
        ,
      "shippingDetails": {
        "@type": "OfferShippingDetails",
        "shippingRate": {
          "@type": "MonetaryAmount",
          "value": "0",
          "currency": "{$currency.iso_code}"
        },
        "shippingDestination": [
          {
            "@type": "DefinedRegion",
            "addressCountry": "FR"
          }
        ]
      }
      {/if*}
    }
    {/if}
  }
</script>
