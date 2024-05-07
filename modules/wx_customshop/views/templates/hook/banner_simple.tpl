<a href="{$result['btn_link'] nofilter}" class="relative overflow-hidden rounded-b-lg lg:rounded-t-lg w-full h-40 lg:h-52">
    <img class="w-full h-full object-cover" src="{$result['content_img'] nofilter}" alt="{$result['alt_text_img'] nofilter}" title="{$result['alt_text_img'] nofilter}" srcset="">
    <figcaption class="w-full bg-white/80 absolute bottom-0 py-2 px-4 flex justify-end gap-3 h-12">
        <span class="flex gap-2 items-center leading-none">
            <span class="flex-1 text-lbg-primary font-semibold hover:underline">{$result['btn_text'] nofilter} </span>
            <svg class="w-5 fill-lbg-primary" xmlns="http://www.w3.org/2000/svg" viewBox="0 -960 960 960" ><path d="M504-480 320-664l56-56 240 240-240 240-56-56 184-184Z"/></svg>
        </span>
    </figcaption>
</a> 
{* $result = array(13) { 
    ["id_banner_any_where"]=> string(1) "2" 
    ["type_banner"]=> string(1) "1" 
    ["content_title"]=> string(5) "Titre" 
    ["content_html"]=> string(0) "" 
    ["content_img"]=> string(74) "https://preprod.lesbonsgamins.fr/img/ets_banneranywhere/65b22a17ea0b20.png" 
    ["alt_text_img"]=> string(3) "Alt" 
    ["content_text"]=> string(5) "Texte" 
    ["content_text_color"]=> string(7) "#ff491d" 
    ["btn_text"]=> string(5) "Texte" 
    ["btn_text_color"]=> string(7) "#42ff0f" 
    ["btn_backgroundg_color"]=> string(7) "#ffff00" 
    ["btn_link"]=> string(15) "Lien du boutton" 
    ["active"]=> string(1) "1" 
} *}

