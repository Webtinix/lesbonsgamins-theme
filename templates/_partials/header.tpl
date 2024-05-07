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

 
<script>
  $(document).ready(function(){
    $('.js-product').on('click', '.wx_removefrom_wishlist', (e) => {
    var product_name = $(e.target).closest(".product-miniature").find("p:first").text().trim();
    var product_cat = $(e.target).closest(".product-miniature").find("p:eq(1)").text().trim();
    var product_price = $(e.target).closest(".product-miniature").find("p:eq(2)").text().trim();
    var productImage = $(e.target).closest('.product-miniature').find('img').attr('src');
    
    dataLayer.push({
        'event': 'removefromWishlist',
        'ecommerce': {
          'add': {
            'products': [{
              'product_name': product_name,
              'product_cat': product_cat,
              'product_price': product_price,
              'productImage': productImage
            }]
          }
        }
      });
      console.log("remove");
    });
  });
</script>

<header class="w-full" x-data="{ openMobileNav: false }">
  <div class="w-full bg-cea0a7" id="subHeader">
    <div class="w-full mx-auto relative" style="max-width: 85rem;">
      <p class="text-white p-2 text-center text-sm">{l s="Livraison offerte dés 49€ d'achat" d='Shop.Theme.Global'}</p>
      <div class="absolute top-0 left-0 w-full p-2 hidden md:flex items-center justify-end">
        <div x-data="{ open_hover: false }" class="group relative">
          <p class="">
            <a href="{l s='tel:+33 (0)4 72 96 09 09' d='Shop.Theme.Global'}" x-on:mouseenter="open_hover = true"
              x-on:mouseleave="open_hover = false" class="text-white text-sm">
              {l s='+33 (0)4 72 96 09 09' d='Shop.Theme.Global'}
            </a>
            <span class="text-white">&nbsp;|&nbsp;</span>
            {l 
              s='[1]https://www.lesbonsgamins.fr/p-qui-sommes-nous--6.html[2]Nous connaître[3]' 
              sprintf=[
                '[1]' => '<a class="text-white hover:underline" href="',
                '[2]' => '">',
                '[3]' => '</a>'

              ]
              d='Shop.Theme.Global'
            }
          </p>
          {* <div x-show="open_hover" class="w-full z-40 relative p-2 pt-3 opacity-0 inivisible hidden group-hover:block group-hover:opacity-1 transition-opacity duration-300 bg-cea0a7"> *}
          <div x-show="open_hover" x-cloak
            class="w-full z-40 relative p-2 pt-3 transition-opacity duration-300 bg-cea0a7">
            <p class="text-sm text-white cursor-default">
              Vous pouvez nous joindre par <br> téléphone ou par mail: <br> lundi au vendredi de 8h à 12h et de <br> 14h
              à 17h
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="bg-white shadow-sm relative">
    <div class="w-full mx-auto" style="max-width: 85rem;">
      <div class="flex items-center justify-between p-4 lg:px-0 lg:py-2">
        {* Left part starts *}
        <div class="flex lg:flex-row-reverse space-x-4 items-center">

          {* Button Toggle mobile nav *}
          {* <button @click="openMobileNav = true" class=""> *}
          <button id="toggleBtn" @mouseenter="openMobileNav = true" @click="openMobileNav = !openMobileNav"
            class="lg:hidden">
            <svg xmlns="http://www.w3.org/2000/svg" width="24.75" height="20.316" viewBox="0 0 24.75 20.316">
              <path id="Tracé_1252" data-name="Tracé 1252" d="M466.667,593.333h16.422"
                transform="translate(-465.167 -591.833)" fill="none" stroke="#00a396" stroke-linecap="round"
                stroke-width="3" />
              <path id="Tracé_1253" data-name="Tracé 1253" d="M466.667,593.333h21.75"
                transform="translate(-465.167 -583.175)" fill="none" stroke="#00a396" stroke-linecap="round"
                stroke-width="3" />
              <path id="Tracé_1254" data-name="Tracé 1254" d="M466.667,593.333h21.75"
                transform="translate(-465.167 -574.517)" fill="none" stroke="#00a396" stroke-linecap="round"
                stroke-width="3" />
            </svg>
          </button>
          <a href="/" class="block" id="desktopLogo">
            <img class="h-7 lg:h-10 lg:mr-10 stickyState hidden" src="{$urls.img_url}logos/LBG Logo_Ligne_Simple.png"
              alt="Logo Les Bons Gamins" title="Logo Les Bons Gamins" />
            <img class="h-7 w-40  lg:hidden" src="{$urls.img_url}logos/LBG Logo_Ligne_Simple.png"
              alt="Logo Les Bons Gamins" title="Logo Les Bons Gamins" />
            <img class="normalState w-60 hidden lg:inline-block" src="{$urls.img_url}logos/LBG Logo_Ligne_Jeu jouet.png"
              alt="Logo Les Bons Gamins" title="Logo Les Bons Gamins" />
          </a>
        </div>
        {* Left part ends *}

        {* Center part starts *}
        <div class="flex-1 hidden lg:flex items-center space-x-4 px-8">
          <div class="relative flex-1 px-4 py-2 search-widgets">
            {hook h='displaySearch'}
          </div>
          <div>
            {l 
              s='[1]https://www.lesbonsgamins.fr/blog/[2]Blog[3]' 
              sprintf=[
                '[1]' => '<a class="px-14 font-medium py-2 rounded border hover:bg-primary hover:text-white text-lbg-primary border-primary" href="',
                '[2]' => '">',
                '[3]' => '</a>'

              ]
              d='Shop.Theme.Global'
            }
          </div>
        </div>
        {* Center part ends *}

        {* Right part starts *}
        {* <div class="relative flex items-center flex-wrap gap-4 lg:gap-6 lg:mr-4"> *}
        <div class="relative flex items-center space-x-4 lg:space-x-6 lg:mr-4">
          {hook h='displayCustomerAccount'}
          {hook h='displayNav2'}
        </div>
      </div>

      {* Searchbar on mobile *}
      <div class="relative w-full px-4 pb-2 lg:hidden search-widgets-mobile">
        {hook h='displaySearch'}
      </div>
    </div>

    {* Mobile navigation *}
    {hook h='displayNav1'}
  </div>

  <div id="wx-overlay" class="absolute h-screen w-full" style="background: rgba(0, 0, 0, 0.5);display:none;">
    <div id="products" class="search_popup -mt-2 md:-mt-6 relative w-full mx-auto bg-transparent z-50"
      style="max-width: 85rem;">
      <div class="w-full bg-white absolute px-4 md:px-8 py-4">
        {* Search result goes here *}
      </div>
    </div>
  </div>

  {* Desktop navigation *}
  {hook h='displayTop'}
</header>


<script>
  $(() => {

    // On Scroll Functionality
    $(window).scroll(() => {
      var windowTop = $(window).scrollTop()

      if (windowTop > 300) {
        $('#desktop-top-menu').removeClass('bg-white')

        $('#desktop-top-menu .normalState').addClass('hidden')
        $('#desktop-top-menu .stickyState').removeClass('hidden')

        $('#desktopLogo .normalState').removeClass('lg:inline-block')
        $('#desktopLogo .stickyState').addClass('lg:inline-block')

        $('#toggleBtn').removeClass('lg:hidden')

        $('.cart-container #cartSummary').addClass('md:-mt-24')
        $('#subHeader').addClass('hidden')
      } else {
        $('#desktop-top-menu').addClass('bg-white')

        $('#desktop-top-menu .normalState').removeClass('hidden')
        $('#desktop-top-menu .stickyState').addClass('hidden')

        $('#desktopLogo .normalState').addClass('lg:inline-block')
        $('#desktopLogo .stickyState').removeClass('lg:inline-block')

        $('#toggleBtn').addClass('lg:hidden')

        $('.cart-container #cartSummary').removeClass('md:-mt-24')
        $('#subHeader').removeClass('hidden')
      }

      var footerPosition = document.getElementById('footer').offsetTop;
      var scrollPosition = window.pageYOffset;

      // if (scrollPosition >= footerPosition - window.innerHeight) {
      //   $('.cart-container #cartSummary').removeClass('lg:fixed')
      // } 
      // else {
      //   $('.cart-container #cartSummary').addClass('lg:fixed')
      // }
    })

    // //Click Logo To Scroll To Top
    // $('#logo').on('click', () => {
    // 	$('html,body').animate({
    // 		scrollTop: 0
    // 	},500);
    // });

    // //Smooth Scrolling Using Navigation Menu
    // $('a[href*="#"]').on('click', function(e){
    // 	$('html,body').animate({
    // 		scrollTop: $($(this).attr('href')).offset().top - 100
    // 	},500);
    // 	e.preventDefault();
    // });

    // //Toggle Menu
    // $('#menu-toggle').on('click', () => {
    // 	$('#menu-toggle').toggleClass('closeMenu');
    // 	$('ul').toggleClass('showMenu');

    // 	$('li').on('click', () => {
    // 		$('ul').removeClass('showMenu');
    // 		$('#menu-toggle').removeClass('closeMenu');
    // 	});
    // });

  });
</script>