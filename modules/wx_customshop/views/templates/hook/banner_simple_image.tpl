{if $result['type_banner'] == '2'}
    <img src="{$result['content_img'] nofilter}" class="object-cover lg:hidden rounded-md md:h-80 object-cover " alt="{$result['alt_text_img'] nofilter}"  title="{$result['alt_text_img'] nofilter}" srcset="" loading="lazy">
{elseif $result['type_banner'] == '3'}
    <img src="{$result['content_img'] nofilter}" class="object-cover w-[70%] z-10 absolute" alt="{$result['alt_text_img'] nofilter}"  title="{$result['alt_text_img'] nofilter}" srcset="" loading="lazy">
{elseif $result['type_banner'] == '4'}
    <img src="{$result['content_img'] nofilter}"  class="object-cover w-[70%] z-7 absolute right-0 bottom-0" alt="{$result['alt_text_img'] nofilter}"  title="{$result['alt_text_img'] nofilter}" srcset="" loading="lazy">
{elseif $result['type_banner'] == '7'}
    <img src="{$result['content_img'] nofilter}"  class="rounded-lg h-52 md:h-80 object-cover w-full" alt="{$result['alt_text_img'] nofilter}"  title="{$result['alt_text_img'] nofilter}" srcset="" loading="lazy">
{/if}