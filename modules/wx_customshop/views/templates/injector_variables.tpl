{if ($product != null)}
    {assign var="product" value=$product scope="global"}
    {hook h='displayProductActions' product=$product}
{/if}