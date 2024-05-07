$(document).on("click", 'ul[id^="facet_"] li', function () {
  $.hasAjaxRunning = function () {
    console.log("running");
  };
  $(document).ajaxStart(function () {
    console.log("started");
  });
  // $(document).ajaxStop(function() {
  //     $([document.documentElement, document.body]).animate({
  //         scrollTop: $("#left-column").offset().top - 180
  //     }, 500);
  // });
});

$("#product-mobilezoom-cta").on("click", function (e) {
  e.preventDefault();

  // On retire le hidden de #product-mobilezoom pour qu'il devienne visible
  $("#product-mobilezoom").removeClass("hidden");
  // $(this).parent().parent().parent().addClass('w-full h-screen bg-black fixed top-0 flex items-center z-999');
  // $('#product-mobilezoom .product-covers .owl-stage').addClass('w-full h-screen bg-black fixed top-0 flex items-center z-999');
  $("#product-mobilezoom #closemobilezoom").removeClass("hidden");

  $("body").addClass("overflow-hidden");
  $(
    '#product-mobilezoom .product-covers .owl-nav button[role="presentation"]'
  ).show();
});
$("#product-mobilezoom #closemobilezoom").on("click", function (e) {
  e.preventDefault();

  // On remet le hidden de #product-mobilezoom
  $("#product-mobilezoom").addClass("hidden");

  $(this).addClass("hidden");
  // $("#product-mobilezoom .product-covers .owl-stage").removeClass('w-full h-screen bg-black fixed top-0 flex items-center z-999');

  $("body").removeClass("overflow-hidden");
  $(
    '#product-mobilezoom .product-covers .owl-nav button[role="presentation"]'
  ).hide();
});

// SCRIPT  QUI VERIFIE SI LE NOMBRE DES ITEMS EST SUFFICSANT POUR AVOIR LES OWL-NAV
// DEBUT---------
// $(window).on('load', function() {
//     // Attendre que tout le contenu de la fenêtre soit chargé, y compris les images
//     var numItems = $('#subcategories .owl-item .cloned .active').length;
//     console.log(numItems);

//     var minItemsToShowNav = 4; // Nombre minimum d'éléments requis pour afficher les boutons de navigation

//     if (numItems <= minItemsToShowNav) {
//         $('#subcategories .owl-nav button[role="presentation"]').hide();
//     } else {
//         $('#subcategories .owl-nav button[role="presentation"]').show();
//     }
// });

// FIN--------------------

// Search
$(document).ready(function () {
  // console.log('prestashop', prestashop)
  var ajaxRequestVariable;
  var $searchPopup = $("#products.search_popup div");
  var $searchWidgets;
  var resultsPerPage;
  if (window.innerWidth > 768) {
    $searchWidgets = $(".search-widgets");
    resultsPerPage = 8;
  } else {
    $searchWidgets = $(".search-widgets-mobile");
    resultsPerPage = 3;
  }
  var $motclefInput = $searchWidgets.find('[name="motclef"]');
  var $body = $("body");

  // if (window.innerWidth > 768) {
  // Définition du délai pour le debouncing
  var debounceTimeout;

  // Fonction pour gérer la recherche
  function handleSearch() {
    var search_key = $motclefInput.val();
    $('input[name="motclef"]').val(search_key);

    // Annulation de la requête en cours (si existante)
    if (
      ajaxRequestVariable !== undefined &&
      ajaxRequestVariable.readyState > 0 &&
      ajaxRequestVariable.readyState < 4
    ) {
      ajaxRequestVariable.abort();
    }

    // Envoi de la nouvelle requête après un court délai
    clearTimeout(debounceTimeout);
    debounceTimeout = setTimeout(function () {
      ajaxRequestVariable = $.ajax({
        type: "GET",
        url: prestashop["urls"]["base_url"] + "recherche",
        data: { motclef: search_key, resultsPerPage: resultsPerPage },
        dataType: "json",
        success: function (data) {
          if (data.products.length >= 1) {
            $body.css({ "overflow-y": "hidden" });
            $searchPopup.parent().parent().show();
            let content =
              '<h2 class="text-xl md:text-2xl font-medium border-b-2 border-gray-300 pb-1 mb-4">Produits</h2><div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-x-6 gap-y-10 mt-6 mb-4">';
            content += "";
            data.products.forEach((product) => {
              content += `
                                <div class="flex space-x-2">
                                    <a href="${product.link}" class="h-20 w-20 bg-gray-200 block">
                                        <img
                                            class="h-full w-full object-contain"
                                            src="${product.cover.medium.url}"
                                        />
                                    </a>
                                    <div class="flex-1 h-full flex flex-col justify-between">
                                        <div class="">
                                            <h3 class="text-[14px] text-gray-950 font-medium"><a class="" href="${product.link}">${product.name}</a></h3>
                                            <p class="text-[12px] text-gray-500 mt-0.5">Goki</p>
                                        </div>
                                        <h4 class="font-bold text-lg">${product.price}</h4>
                                    </div>
                                </div>
                                `;
            });
            content += "</div>";
            content += `
                                <div class="flex items-center justify-center pt-4 md:pb-0 pb-4">
                                    <a href="recherche?controller=search&motclef=${search_key}" class="w-full md:w-auto bg-lbg-primary py-2 rounded px-20 text-white text-sm text-center">Voir tous les produits (${data.pagination.total_items})</a>
                                </div>
                            `;
            $searchPopup.html(content);
          } else {
            $body.css({ "overflow-y": "auto" });
            $searchPopup.parent().parent().hide();
          }
        },
      });
    }, 300);
  }

  // Gestion de la recherche lors de la saisie
  $motclefInput.on("input", handleSearch);

  // Gestion du clic sur l'overlay
  $("#wx-overlay").on("click", function (event) {
    if ($(event.target).is("#wx-overlay")) {
      $searchPopup.parent().parent().hide();
      $body.css({ "overflow-y": "auto" });
    }
  });
  // }

  $searchPopup.parent().parent().addClass("mt-4");
});

// ===================== Sticky top header scripts start ===================== //
// =====================
$(document).ready(function () {
  // Fonction pour gérer le comportement du logo et de la recherche lors du défilement
  function handleScroll() {
    if ($(window).scrollTop() != 0) {
      $("#_desktop_logo").addClass("hidden");
      $("#_desktop_logo_2").removeClass("hidden");
      $(".logo-container").removeClass("is_full_logo");
      $("div.search_popup").removeClass("is_top");
    } else {
      $("#_desktop_logo_2").addClass("hidden");
      $("#_desktop_logo").removeClass("hidden");
      $(".logo-container").addClass("is_full_logo");
      $("div.search_popup").addClass("is_top");
    }
  }

  // Gérer le défilement au chargement de la page
  handleScroll();

  // Gérer le défilement en cas de modification de la position de la fenêtre
  $(window).scroll(handleScroll);

  // Gestion du comportement pour les écrans de petite largeur (en commentaire)
  /*
    if (window.innerWidth <= 480) {
        var lastScrollTop = 0;

        $(window).on('scroll', function(event) {
            var st = $(this).scrollTop();

            // Si l'utilisateur fait défiler vers le bas
            if (st > lastScrollTop) {
                // Masquer l'en-tête et le formulaire de recherche
                $('header#header').removeClass('show_and_down');
                $('form#mobile_search_form').removeClass('show_and_down');

                if (!$('header#header').hasClass('up_and_hide')) {
                    // Ajouter des classes pour masquer l'en-tête et le formulaire de recherche
                    $('header#header').addClass('up_and_hide');
                    $('form#mobile_search_form').addClass('up_and_hide');
                    setTimeout(function() {
                        // Ajouter des classes pour changer la position
                        $('form#mobile_search_form').addClass('top-2');
                        $('header#header').addClass('-top-24');
                    }, 1200);
                }
            } else { // Si l'utilisateur fait défiler vers le haut
                // Rétablir l'affichage de l'en-tête et du formulaire de recherche
                $('header#header').removeClass('up_and_hide -top-24');
                $('form#mobile_search_form').removeClass('up_and_hide top-2');

                if (!$('header#header').hasClass('show_and_down')) {
                    // Ajouter des classes pour afficher l'en-tête et le formulaire
                    $('header#header').addClass('show_and_down');
                    $('form#mobile_search_form').addClass('show_and_down');

                    setTimeout(function() {
                        // Vous pouvez effectuer des actions supplémentaires ici si nécessaire
                    }, 2000);
                }
            }
            lastScrollTop = st;
        });
    }
    */
});
// =====================
// ===================== Sticky top header scripts start ===================== //

// ===================== Extra scripts start ===================== //
// =====================
$("#close-product-images-modal").on("click", function (e) {
  $(".modal.js-product-images-modal").trigger("click");
});

// ======== Input check box
$(document).ready(function () {
  // if($("input#true").prop("checked", true)) {
  //     $('.lbg-input-radio').css('background', '#00A193');
  // }

  $("input#true").on("change", function () {
    if ($(this).prop("checked", true)) {
      $(".lbg-input-radio").css("background", "#00A193");
    }
  });
  $("input#false").on("change", function () {
    if ($(this).prop("checked", true)) {
      $(".lbg-input-radio").css("background", "#C7CCCC");
    }
  });
});

// ======== Accordion
function openAnsSection(val) {
  var p = document.getElementById("para" + val);
  var svg = document.getElementById("path" + val);

  if (p.classList.contains("hidden")) {
    p.classList.remove("hidden");
    p.classList.add("block");
  } else {
    p.classList.remove("block");
    p.classList.add("hidden");
  }

  if (svg.classList.contains("hidden")) {
    svg.classList.remove("hidden");
    svg.classList.add("block");
  } else {
    svg.classList.remove("block");
    svg.classList.add("hidden");
  }
}

// ======== Sicky filters
// $(document).ready(function() {
//     // Obtenez la position de la barre latérale au chargement de la page
//     var stickySidebar = $('#search_filters').offset().top;

//     // Gérez la position de la barre latérale en fonction du défilement
//     $(window).scroll(function() {
//         if ($(window).scrollTop() > stickySidebar) {
//             $('#search_filters').addClass('affix lbg-scrollbar');
//         } else {
//             $('#search_filters').removeClass('affix lbg-scrollbar');
//         }

//         // Vérifiez si le pied de page est visible
//         if ($(window).scrollTop() + $(window).height() > $('#footer').offset().top) {
//             $('#search_filters').removeClass('affix lbg-scrollbar');
//         }
//     });
// });

// Recenter filters
// $(document).ready(function(){
//     var url = new URL(location.href);
//     var stickySidebar;

//     if(url.searchParams.get("q") != null) {
//         $([document.documentElement, document.body]).animate({
//             scrollTop: $("#left-column").offset().top - 400
//         }, 2000);
//     };
// })

// ======== Tabs
let tabsContainer = document.querySelector("#wx-tabs");

// if(tabsContainer) {
//     let tabTogglers = tabsContainer.querySelectorAll("a");

//     tabTogglers.forEach(function(toggler) {
//         toggler.addEventListener("click", function(e) {
//             e.preventDefault();

//             let tabName = this.getAttribute("href");

//             let tabContents = document.querySelector("#wx-tab-contents");

//             for (let i = 0; i < tabContents.children.length; i++) {

//             tabTogglers[i].parentElement.classList.remove();  tabContents.children[i].classList.remove("hidden");
//             if ("#" + tabContents.children[i].id === tabName) {
//                 continue;
//             }
//             tabContents.children[i].classList.add("hidden");

//             }
//             e.target.parentElement.classList.add();
//         });
//     });

//     var wx_default_tab = document.getElementById("wx-default-tab");
//     if(wx_default_tab) {
//         wx_default_tab.click();
//     }
// }
$('[href="#first"]').on("click", function () {
  $("#wx-tabs").hide();
});
// =====================
// ===================== Extra scripts end ===================== //

// ===================== Brands page scripts start ===================== //
// =====================
// ======== Filter brands
(function () {
  let a = "abcdefghijklmnopqrstuvwxyz".split("");
  a.forEach((l) => {
    l = l.toUpperCase();
    $(".alphabet_filter").append(
      `<span class="alphabet inline-block text-xl px-2 py-0.5 m-1 hover:bg-gray-200 rounded cursor-pointer">${l}</span>`
    );
  });
  $(".alphabet_filter").append(`<span class="">-</span>`);
  $(".alphabet_filter").append(
    `<span class="alphabet bg-gray-200 text-lg px-2 py-0.5 m-1 hover:bg-gray-200 rounded cursor-pointer uppercase font-semibold">Tout</span>`
  );

  $(".alphabet").on("click", function () {
    $(".alphabet").removeClass("bg-gray-200");
    $(this).addClass("bg-gray-200");
    var letter = $(this).text();
    var brands = $(".brand");
    $.each(brands, function (key, value) {
      var text = $(value).find("div.brand-infos a").text();
      if (letter == "Tout") {
        $(".brand").removeClass("hidden");
      } else if (text.toUpperCase().match("^" + letter)) {
        $(value).removeClass("hidden");
      } else {
        $(value).addClass("hidden");
      }
    });
  });
})();
// =====================
// ===================== Tunnel scripts end ===================== //

// ===================== Tunnel scripts start ===================== //
// =====================
// ======== Shipping step
// $('.delivery-option.js-delivery-option').on('click', function(){
//     setTimeout(function(){
//         location.reload();
//     }, 3000);
// });

// ======== Paiement step
// $('#payment-option-2-container').on('click', function() {
//     $('.js-payment-confirmation button[type="submit"]').toggleClass('hidden');
// });
// $(document).on('change', function(){
//     if ($('input[name="payment-option"][data-module-name="paypal"]').is(':checked') && $('input[name="payment-option"][data-module-name="paypal"]').val() == 'on') {
//         $('#payment-confirmation .ps-shown-by-js').addClass('hidden');
//     } else {
//         $('#payment-confirmation .ps-shown-by-js').removeClass('hidden');
//     }
// });

// ======== Adress step
$(document).ready(function () {
  if ($("#field-company").val()) {
    $(".vat_number").removeClass("hidden");
  } else {
    $(".vat_number").addClass("hidden");
  }
});
$("#field-company").on("change", function () {
  if ($(this).val()) {
    $(".vat_number").removeClass("hidden");
  } else {
    $(".vat_number").addClass("hidden");
  }
});

// ======== Steps Tunnel
$("p.step-title").on("click", function () {
  $(".checkout-step .content").css("display", "none");
  var id = $(this).parent().attr("id");
  $("[data-id=" + id + "] .content").css("display", "block");
});
// =====================
// ===================== Tunnel scripts end ===================== //

// ===================== Product miniature & Product page scripts start ===================== //
// =====================
// ======== Loggin modal
$("body").on("click", ".wx-loggin-modal", function (e) {
  e.preventDefault();
  var action = $(this).attr("data-wx-action");
  var parent = $(this).closest("[data-id-product]");
  var id_product = $(parent).attr("data-id-product");
  var id_product_attribute =
    $(".js-product-variants .variant[data-product-attribute]").prop(
      "selectedIndex"
    ) + 1;
  var redirect_url =
    "https://" +
    window.location.host +
    $("#login-before-action").attr("data-redirect-url");
  var href = $("#login-before-action").attr("href");
  var modalText = $(this).attr("data-modal-text");
  var qty = $("#quantity_wanted").val();
  if (qty == undefined) {
    qty = 1;
  }
  if (isNaN(id_product_attribute)) {
    id_product_attribute = $(this)
      .closest("article")
      .data("id-product-attribute");
  }

  hrefArr = href.split("?");
  href = hrefArr[0];

  $("#login-before-action-text").text(modalText);
  if (id_product) {
    $("#login-before-action").attr(
      "href",
      href +
        "?back=" +
        redirect_url +
        "&id_product=" +
        id_product +
        "&wx_action=" +
        action +
        "&id_product_attribute=" +
        id_product_attribute +
        "&qty=" +
        qty
    );
  } else {
    $("#login-before-action").attr(
      "href",
      href + "?back=" + $(this).attr("href")
    );
  }

  $("#wx-loggin-modal").removeClass("hidden");
  $("#wx-loggin-modal").addClass("flex");
});
$("#wx-loggin-modal #close").click(function () {
  $("#wx-loggin-modal").removeClass("flex");
  $("#wx-loggin-modal").addClass("hidden");
});
$("body").on("click", function (event) {
  if ($(event.target).is("#wx-loggin-modal")) {
    $("#wx-loggin-modal").removeClass("flex");
    $("#wx-loggin-modal").addClass("hidden");
  }
});

// ======== Eco-part modal
$(".wx-ecopart-btn").click(function (e) {
  $("#wx-ecopart-modal").removeClass("hidden");
  $("#wx-ecopart-modal").addClass("flex");
});
$("#wx-ecopart-modal #close").click(function () {
  $("#wx-ecopart-modal").removeClass("flex");
  $("#wx-ecopart-modal").addClass("hidden");
});
$("body").on("click", function (event) {
  if ($(event.target).is("#wx-ecopart-modal")) {
    $("#wx-ecopart-modal").removeClass("flex");
    $("#wx-ecopart-modal").addClass("hidden");
  }
});

// ======== Newsletter modal
$("button.wx-newsletter-btn").click(function (e) {
  $("#wx-newsletter-modal").removeClass("hidden");
  $("#wx-newsletter-modal").addClass("flex");
});
$("#wx-newsletter-modal #close").click(function () {
  $("#wx-newsletter-modal").removeClass("flex");
  $("#wx-newsletter-modal").addClass("hidden");
});
$("body").on("click", function (event) {
  if ($(event.target).is("#wx-newsletter-modal")) {
    $("#wx-newsletter-modal").removeClass("flex");
    $("#wx-newsletter-modal").addClass("hidden");
  }
});

// // ======== Waitinglist modal
// $('button.waitinlist-modal-btn').click(function(e) {
//     // alert('clicked!!!')
//     $('#wx-waitinglist-modal').removeClass('hidden');
//     $('#wx-waitinglist-modal').addClass('flex');
// });
// $('#wx-waitinglist-modal #close').click(function() {
//     $('#wx-waitinglist-modal').removeClass('flex');
//     $('#wx-waitinglist-modal').addClass('hidden');
// });
// $('body').on('click',function(event){
//     if($(event.target).is('#wx-waitinglist-modal')){
//         $('#wx-waitinglist-modal').removeClass('flex');
//         $('#wx-waitinglist-modal').addClass('hidden');
//     }
// });
$("#product_waitinglist_form").submit(function (e) {
  e.preventDefault();

  var form = $(this);
  var actionUrl = form.attr("action");

  $.ajax({
    type: "POST",
    url: actionUrl,
    data: form.serialize(),
    success: function (data) {
      $("#wx-waitinglist-modal #modal-body").html(`
            <p>Vous serez notifié du retour de cet article</p>
          `);
    },
  });
});

(function () {
  var description = $(".product-description").text();
  var count_desc = description.length;
  var max_text_len = 150;
  var width = window.innerWidth > 0 ? window.innerWidth : screen.width;

  if (count_desc > max_text_len && width <= 700) {
    description_first = description.substring(0, max_text_len);
    description_second = description.substring(max_text_len);
    $(".product-description").html(
      description_first +
        `
            <span class="dots">...</span> <button class="desc_toggle_btn mt-1 lbg-text-primary underline">en savoir plus</button>
            <span id="second_text" class="hidden">` +
        description_second +
        `</span>
            <button class="desc_toggle_btn hidden mt-1 lbg-text-primary underline">voir moins</button>`
    );
    $(".desc_toggle_btn").on("click", function () {
      $(".desc_toggle_btn").toggleClass("hidden");
      $("#second_text").toggleClass("hidden");
      $(".product-description .dots").toggleClass("hidden");
    });
  }

  $("#degressif_mobile_hide").on("click", function () {
    $("#degressif_mobile").addClass("hidden");
  });
  $("#degressif_mobile_show").on("click", function () {
    $("#degressif_mobile").removeClass("hidden");
  });
})();

(function () {
  // Add to cart from wishlist (in cart page)
  $("#cart-wishlist .add-to-cart").on("click", function () {
    // location.reload();
  });

  // ======== Add to cart after login action
  $(document).ready(function () {
    if (
      wx_addto_params["action"] == "addto_cart" &&
      wx_addto_params["id_product"] != 0 &&
      wx_addto_params["can_add"]
    ) {
      var showModal =
        prestashop.blockcart.showModal ||
        function (modal) {
          var $body = $("body");
          $body.append(modal);
          $body.on("click", "#blockcart-modal", function (event) {
            if (event.target.id === "blockcart-modal") {
              $(event.target).remove();
            }
          });
        };
      var token = wx_addto_params["token"];
      var id_product = wx_addto_params["id_product"];
      var qty = wx_addto_params["qty"];
      var id_product_attribute = wx_addto_params["id_product_attribute"];
      $.ajax({
        url:
          document.location.origin +
          "/shopping_cart?token=" +
          token +
          "&id_product=" +
          id_product +
          "&id_product_attribute=" +
          id_product_attribute +
          "&id_customization=0&qty=" +
          qty +
          "&add=1&action=update",
        type: "POST",
        dataType: "json",
        success: function (data) {
          $.ajax({
            url:
              document.location.origin +
              "/module/ps_shoppingcart/ajax?id_customization=0&id_product_attribute=" +
              id_product_attribute +
              "&id_product=" +
              id_product +
              "&action=add-to-cart",
            type: "POST",
            dataType: "json",
            success: function (data) {
              showModal(data.modal);
            },
          });
        },
      });
    }
  });

  // ======== Add to wishlist after login action
  $(document).ready(function () {
    if (
      wx_addto_params["action"] == "addto_wishlist" &&
      wx_addto_params["id_product"] != 0 &&
      wx_addto_params["id_wishlist"] != 0
    ) {
      var id_product = wx_addto_params["id_product"];
      var id_wishlist = wx_addto_params["id_wishlist"];

      $.ajax({
        url:
          document.location.origin +
          "/module/blockwishlist/action?action=addProductToWishlist&params[id_product]=" +
          id_product +
          "&params[idWishList]=" +
          id_wishlist +
          "&params[quantity]=0&params[id_product_attribute]=0",
        type: "GET",
        dataType: "json",
        success: function (data) {
          // change icon and button class
          // $('.material-icons[data-id-product="'+id_product+'"]').text('favorite');
          // $('.material-icons[data-id-product="'+id_product+'"]').parent().addClass('wx_removefrom_wishlist');
          // $('.material-icons[data-id-product="'+id_product+'"]').parent().removeClass('wx_addto_wishlist');
          // $('.material-icons[data-id-product="'+id_product+'"]').text('favorite');
          $('.wx_btn_wishlist[data-id-product="' + id_product + '"]')
            .parent()
            .addClass("wx_removefrom_wishlist");
          $('.wx_btn_wishlist[data-id-product="' + id_product + '"]')
            .parent()
            .removeClass("wx_addto_wishlist");

          // Show toast
          $("#snackbar").addClass("show lbg-bg-success");
          $("#snackbar").text("Produit ajouté aux favoris");

          // Enable clicking button
          // $('a#wishlist-link').attr('href', "https://" + window.location.host + "/mes-favoris");

          // Update total
          var total_wishlist = parseInt($("#wishlist-link span.h-4").text());
          total_wishlist = parseInt(total_wishlist) + 1;
          $("#wishlist-link span.h-4").text(`${total_wishlist}`.slice(-1));

          // Hide toast
          setTimeout(function () {
            $("#snackbar").removeClass("show lbg-bg-success");
          }, 3000);
        },
      });

      // Data layer Wishlist
      dataLayer.push({
        event: "addToWishlist",
        ecommerce: {
          add: {
            products: [
              {
                name: wx_addto_params["product_name"],
                id: wx_addto_params["id_product"],
                price: wx_addto_params["product_price"],
                brand: wx_addto_params["product_brand"],
                // Add more relevant product details as needed
              },
            ],
          },
        },
      });
    }
  });

  // ======== Add to wishlist
  var clicks = 0;
  $("section").on(
    "click",
    "div > button.wx_addto_wishlist, div > img.wx_addto_wishlist",
    function () {
      clicks++;

      if (clicks == 1) {
        setTimeout(function () {
          clicks = 0;
        }, 1000);
        var me = $(this);
        var id_product = me.attr("data-id-product");
        var id_product_attribute = me.attr("data-id-product-attribute");
        var id_wishlist = me.attr("data-id-wishlist");

        // var button = $(this);

        $.ajax({
          url:
            document.location.origin +
            "/module/blockwishlist/action?action=addProductToWishlist&params[id_product]=" +
            id_product +
            "&params[idWishList]=" +
            id_wishlist +
            "&params[quantity]=0&params[id_product_attribute]=" +
            id_product_attribute,
          type: "GET",
          dataType: "json",
          success: function (data) {
            // change icon and button class
            // $('.wx_btn_wishlist[data-id-product="'+id_product+'"]').text('favorite');
            // $(button).addClass('wx_removefrom_wishlist');
            // $(button).removeClass('wx_addto_wishlist');

            // Show toast
            $("#snackbar").addClass("show lbg-bg-success");
            $("#snackbar").text("Produit ajouté aux favoris");

            // On va changer cacher l'image d'ajout à la wishlist
            // me.addClass('hidden');
            // me.parents('.wx_wishlist_btns[data-btns-wishlist-id-product="' + id_product + '"]').find('img.wx_btn_wishlist.wx_removefrom_wishlist').removeClass('hidden');
            me.addClass("hidden");
            me.parents(".wx_wishlist_btns")
              .find("img.wx_removefrom_wishlist")
              .removeClass("hidden");

            // console.log(me.parents('.js-product.product'));

            // Enable clicking button
            // $('a#wishlist-link').attr('href', "https://" + window.location.host + "/mes-favoris");

            // Update total
            var total_wishlist = parseInt($("#wishlist-link span.h-4").text());
            total_wishlist = parseInt(total_wishlist) + 1;
            $("#wishlist-link span.h-4").text(`${total_wishlist}`.slice(-1));

            // Hide toast
            setTimeout(function () {
              $("#snackbar").removeClass("show lbg-bg-success");
            }, 3000);
          },
        });

        // console.log(dataLayer);
        if (typeof dataLayer !== "undefined" && dataLayer !== null) {
          // Data layer Wishlist
          dataLayer.push({
            event: "addToWishlist",
            ecommerce: {
              add: {
                products: [
                  {
                    name: $(parent).attr("data-product-name"),
                    id: $(parent).attr("data-id-product"),
                    price: $(parent).attr("data-product-price"),
                    brand: $(parent).attr("data-product-brand"),
                    // Add more relevant product details as needed
                  },
                ],
              },
            },
          });
        }
        location.reload();
      }
    }
  );

  // ======== Remove from wishlist
  $("section").on(
    "click",
    "div > button.wx_removefrom_wishlist, div > img.wx_removefrom_wishlist",
    function (e) {
      clicks++;

      if (clicks == 1) {
        setTimeout(function () {
          clicks = 0;
        }, 1000);
        // var parent = $(this).closest('[data-id-product]');
        // var to_remove = $(this).closest('.favoris');
        // var id_product = $(parent).attr('data-id-product');
        // var id_product_attribute = $(parent).attr('data-id-product-attribute');
        // var id_wishlist = $(parent).attr('data-id-wishlist');
        var me = $(this);
        var to_remove = $(this).closest(".favoris");
        var id_product = me.attr("data-id-product");
        var id_product_attribute = me.attr("data-id-product-attribute");
        var id_wishlist = me.attr("data-id-wishlist");

        var button = $(this);

        $.ajax({
          url:
            document.location.origin +
            "/module/blockwishlist/action?action=deleteProductFromWishlist&params[id_product]=" +
            id_product +
            "&params[idWishList]=" +
            id_wishlist +
            "&params[quantity]=0&params[id_product_attribute]=" +
            id_product_attribute,
          type: "GET",
          dataType: "json",
          success: function (data) {
            // change icon and button class
            // $('.material-icons[data-id-product="'+id_product+'"]').text('favorite_border');
            // $(button).addClass('wx_addto_wishlist');
            // $(button).removeClass('wx_removefrom_wishlist');

            // Show toast
            $("#snackbar").addClass("show lbg-bg-error");
            $("#snackbar").text("Produit retiré des favoris");

            // On va changer cacher l'image d'ajout à la wishlist
            // me.addClass('hidden');
            // me.parents('.wx_wishlist_btns[data-btns-wishlist-id-product="' + id_product + '"]').find('img.wx_btn_wishlist.wx_addto_wishlist').removeClass('hidden');
            me.addClass("hidden");
            me.parents(".wx_wishlist_btns")
              .find("img.wx_addto_wishlist")
              .removeClass("hidden");

            // console.log($('div > img.wx_btn_wishlist.wx_addto_wishlist'));

            // Update total
            var total_wishlist = parseInt($("#wishlist-link span.h-4").text());
            total_wishlist = parseInt(total_wishlist) - 1;
            $("#wishlist-link span.h-4").text(`${total_wishlist}`.slice(-1));

            // Remove el if in favoris controller
            if (to_remove) {
              $(to_remove).remove();
              location.reload();
            }

            // Hide toast
            setTimeout(function () {
              $("#snackbar").removeClass("show lbg-bg-error");
            }, 3000);

            var product_name = $(e.target)
              .closest(".product-miniature")
              .find("p:first")
              .text()
              .trim();
            var product_cat = $(e.target)
              .closest(".product-miniature")
              .find("p:eq(1)")
              .text()
              .trim();
            var product_price = $(e.target)
              .closest(".product-miniature")
              .find("p:eq(2)")
              .text()
              .trim();
            var productImage = $(e.target)
              .closest(".product-miniature")
              .find("img")
              .attr("src");
            // alert(product_name, product_cat, product_price, productImage)

            // dataLayer.push({
            //     'event': 'removefromWishlist',
            //     'ecommerce': {
            //     'add': {
            //         'products': [{
            //         'product_name': product_name,
            //         'product_cat': product_cat,
            //         'product_price': product_price,
            //         'productImage': productImage
            //         }]
            //     }
            //     }
            // });
          },
        });
      }
    }
  );
})();

// ======== Delete from cart
// $('.cart-line-product-actions').on('click', '.remove-from-cart', function() {
//     $(this).closest('.cart-item.js-product.product').remove();
//     // Show toast
//     $('#snackbar').addClass('show lbg-bg-error');
//     $('#snackbar').text('Produit retiré du panier');

//     // Hide toast
//     setTimeout(function(){
//         $('#snackbar').removeClass('show lbg-bg-error');
//         location.reload();
//     }, 2000);
// });

// ======== Youtube video fiche produit
$(".video-yt").on("click", function () {
  $(".product-cover img").hide();
  $(".product-cover .layer").hide();
  $(".product-cover iframe").show();
});
$(".thumb.img-thumb").on("click", function () {
  $(".product-cover img").show();
  $(".product-cover .layer").show();
  $(".product-cover iframe").hide();
});

$(".js-thumb-container").on("click", function () {
  var imageUrl = $(this).find("img").attr("data-image-large-src");
  $("#mobile-zoom").attr("href", imageUrl);
});

// =====================
// ===================== Product miniature & Product page scripts end ===================== //

// $('#close_search_filters').on('click', function(){
//     $('#search_filter_controls .ok').trigger('click');
// });

// ===================== Owl Carousel scripts start ===================== //
// =====================
// ======== Owl Carousel
$(document).ready(function () {

  $("#brand-categories").owlCarousel({
    items: 6,
    loop: $("#brand-categories").children().length >= 7 ? true : false,
    rewind: true,
    margin: 10,
    dots: false,
    nav: true,
    lazyLoad: true,
    autoplay: true,
    navText: [
      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648" transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,

      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776" transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,
    ],
    responsive: {
      0: {
        items: 1,
        loop: true,
      },
      600: {
        items: 2,
        loop: true,
      },
      1000: {
        items: 6,
        nav: $("#brand-categories").children().length < 7 ? false : true,
      },
    },
  });

  $("#subcategories__").owlCarousel({
    items: 6,
    loop: $("#subcategories__").children().length >= 7 ? true : false,
    rewind: true,
    margin: 10,
    dots: false,
    nav: true,
    lazyLoad: true,
    autoplay: true,
    navText: [
      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648" transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,

      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776" transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,
    ],
    responsive: {
      0: {
        items: 1,
        loop: true,
      },
      600: {
        items: 2,
        loop: true,
      },
      1000: {
        items: 6,
        nav: $("#subcategories__").children().length < 7 ? false : true,
      },
    },
  });

  // Product covers slider
  let productCovers = $(".product-covers");
  productCovers.on("initialized.owl.carousel", function (event) {
    $("#product-mobilezoom .product-covers .owl-stage").addClass(
      "w-full h-screen bg-black fixed top-0 flex items-center z-999"
    );
  });
  productCovers.owlCarousel({
    items: 1,
    loop: true,
    dots: true,
    nav: true,
    video: true,
    lazyLoad: false,
  });

  $(document).ready(function () {
    $("#displayhome").owlCarousel({
      startPosition: 2,

      items: 4,
      margin: 10,
      loop: true,
      dots: true,
      nav: true,
      animateOut: "slideOutDown",
      animateIn: "flipInX",
      autoplayHoverPause: true,
      lazyLoad: true,
      autoplay: false,
      // autoplay: true,
      navText: [
        `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648" transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,

        `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776" transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,
      ],
      responsive: {
        0: {
          items: 2,
        },
        600: {
          items: 2,
        },
        1000: {
          items: 4,
        },
      },
    });
  });

  $("#displayProductReco").owlCarousel({
    items: 4,
    margin: 10,
    loop: true,
    dots: false,
    nav: true,
    animateOut: "slideOutDown",
    animateIn: "flipInX",
    autoplayHoverPause: true,
    lazyLoad: true,
    autoplay: false,
    // autoplay: true,
    navText: [
      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648" transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,

      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776" transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,
    ],
    responsive: {
      0: {
        items: 2,
      },
      600: {
        items: 2,
      },
      1000: {
        items: 4,
      },
    },
  });

  $("#displayhome_children").owlCarousel({
    items: 4,
    margin: 10,
    loop: true,
    dots: true,
    nav: true,
    animateOut: "slideOutDown",
    animateIn: "flipInX",
    autoplayHoverPause: true,
    lazyLoad: true,
    autoplay: false,
    // autoplay: true,
    navText: [
      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648" transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,

      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776" transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,
    ],
    responsive: {
      0: {
        items: 2,
      },
      600: {
        items: 2,
      },
      1000: {
        items: 4,
      },
    },
  });

  $("#displayhome_children_wood").owlCarousel({
    items: 4,
    margin: 10,
    loop: true,
    dots: true,
    nav: true,
    animateOut: "slideOutDown",
    animateIn: "flipInX",
    autoplayHoverPause: true,
    lazyLoad: true,
    autoplay: false,
    // autoplay: true,
    navText: [
      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648" transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,

      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776" transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,
    ],
    responsive: {
      0: {
        items: 2,
      },
      600: {
        items: 2,
      },
      1000: {
        items: 4,
      },
    },
  });

  // let items_subcategory = 4;
  // if($(window).width() < 768){
  //     items_subcategory = 2;
  // }

  $("#subcategories").owlCarousel({
    items: 4,
    margin: 10,
    loop: $("#subcategories").children().length >= 5 ? true : false,
    dots: $("#subcategories").children().length >= 5 ? true : false,
    nav: true,
    autoplayHoverPause: true,
    lazyLoad: true,
    autoplay: false,
    navText: [
      `<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 md:h-10 md:w-10" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648" transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,

      `<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 md:h-10 md:w-10" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776" transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,
    ],
    responsive: {
      0: {
        items: 1,
        loop: $("#subcategories").children().length >= 2 ? true : false,
        dots: $("#subcategories").children().length >= 2 ? true : false,
        nav: $("#subcategories").children().length >= 2 ? true : false,
      },
      600: {
        items: 2,
      },
      1000: {
        items: 4,
      },
    },
    onInitialized: function (event) {
      var activeItems = event.item.count; // Nombre d'éléments actifs dans le carousel
      var showNav = activeItems > 4; // Vérifier si le nombre d'éléments actifs est supérieur à 4
      $("#subcategories").find(".owl-nav").toggle(showNav); // Afficher ou masquer les boutons de navigation en fonction du résultat
    },
  });

  $("#brand-selection-produits").owlCarousel({
    items: 4,
    margin: 10,
    loop: true,
    dots: true,
    nav: true,
    animateOut: "slideOutDown",
    animateIn: "flipInX",
    autoplayHoverPause: true,
    lazyLoad: true,
    autoplay: true,
    navText: [
      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#fff" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5646.673,1005l-9.673,9.127,9.673,10.648" transform="translate(-5623.243 -994.252)" fill="none" stroke="#00a396" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,

      `<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40">
            <g id="Ellipse_240" data-name="Ellipse 240" fill="#00a396" stroke="#00a396" stroke-width="1">
                <circle cx="20" cy="20" r="20" stroke="none"/>
                <circle cx="20" cy="20" r="19.5" fill="none"/>
            </g>
            <path id="Tracé_1270" data-name="Tracé 1270" d="M5637,1005l9.673,9.127L5637,1024.776" transform="translate(-5620.43 -994.252)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"/>
            </svg>
            `,
    ],
    responsive: {
      0: {
        items: 1,
      },
      600: {
        items: 2,
      },
      1000: {
        items: 4,
      },
    },
  });

  $("#footer_slider").owlCarousel({
    items: 4,
    loop: true,
    dots: false,
    nav: true,
    navText: [
      '<i class="material-icons text-black"></i>',
      '<i class="material-icons text-black"></i>',
    ],
    responsive: {
      0: {
        items: 1,
      },
      600: {
        items: 4,
      },
      1000: {
        items: 4,
      },
    },
  });
});
// =====================
// ===================== Owl carousel scripts end ===================== //

// ===================== Scroll to anchor ===================== //
$('a[href^="#"]:not([href="#"])').on("click", function (e) {
  e.preventDefault(); // Empêcher le comportement par défaut de l'ancre

  let anchor = $(this).attr("href"); // Lire l'attribut href de l'ancre

  // Récupérer la position de la balise cible
  var targetElement = document.querySelector(anchor);
  var targetOffset = targetElement.getBoundingClientRect().top;

  // Calculer la position de défilement nécessaire pour centrer la cible
  var scrollPosition = targetOffset - window.innerHeight / 2;

  // Animer le défilement pour rendre la balise cible au centre de l'écran
  window.scrollTo({
    top: scrollPosition,
    behavior: "smooth", // Cette option rend le défilement fluide
  });
});

//debut code schadrac 27-02-2024

$(document).ready(function () {
  $(".dropdown-menu").css("z-index", "99");

  function scrollToZone() {
    $("html, body").animate(
      {
        scrollTop: $("#js-product-list-top").offset().top,
      },
      "slow"
    );
    // console.log('AJOUT DU SCROLLBAR');
  }
  // scrollToZone();

  function removeAccents(str) {
    return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
  }

  // Utilisation de l'écouteur de saisie sur le champ de recherche
  $("#PremierChampsLateralGauche").on("keyup", function () {
    var searchText = removeAccents($(this).val().toLowerCase());
    var searchTerms = searchText.split(/\s+/); // Séparer le texte entré en termes individuels

    $(".js-product").each(function () {
      var productName = removeAccents($(this).find("h2").text().toLowerCase());
      var productMatches = false;

      // Vérifier si le nom du produit contient au moins l'un des termes de recherche
      $.each(searchTerms, function (index, term) {
        if (productName.indexOf(term) !== -1) {
          productMatches = true;
          return false; // Sortir de la boucle each si un terme correspond
        }
      });

      // Afficher ou masquer le produit en fonction des correspondances
      if (productMatches) {
        $(this).show(); // Afficher le produit si au moins un terme correspond
      } else {
        $(this).hide(); // Masquer le produit sinon
      }
    });
  });

  $("#DeuxiemeChampsLateralGauche").on("keyup", function () {
    var searchText = removeAccents($(this).val().toLowerCase());
    var searchTerms = searchText.split(/\s+/);

    $(".facet-label").each(function () {
      var productName = removeAccents($(this).find("a").text().toLowerCase());
      var productMatches = false;

      $.each(searchTerms, function (index, term) {
        if (productName.indexOf(term) !== -1) {
          productMatches = true;
          return false; // Sortir de la boucle each si un terme correspond
        }
      });

      if (productMatches) {
        $(this).show(); // Afficher le produit si au moins un terme correspond
      } else {
        $(this).hide(); // Masquer le produit sinon
      }
    });
  });

  // Ajout d'un code promo
  $(document).ajaxSuccess(function (event, xhr, settings) {
    const ok =
      /token=[0-9a-f]{32}&addDiscount=1&discount_name=[^&]+&ajax=1&action=([^&]+)/.test(
        settings.data
      );
    if (settings.url === document.location.origin + "/shopping_cart" && ok) {
      const res = xhr.responseJSON;
      if (res.hasError) {
        $(
          '[data-link-action="add-voucher"] input[name="discount_name"]'
        ).addClass("border-red-500");

        $('[data-link-action="add-voucher"] #error').replaceWith(`
                    <div id="error" class="flex items-center space-x-1 mt-1">
                        <span class="w-4 h-4 rounded-full bg-red-500 flex items-center justify-center text-xs text-white">!</span>
                        <span class="text-xs text-red-500 text">${res.errors[0]}</span>
                    </div>
                `);
      }
    }
  });

  // Refresh cartSummary
  $(document).ajaxSuccess(function (event, xhr, settings) {
    // console.log(event, settings, xhr)
    if (
      settings.url ===
      prestashop["urls"]["base_url"] +
        "commande?ajax=1&action=selectDeliveryOption"
    ) {
      $.ajax({
        type: "POST",
        url:
          prestashop["urls"]["base_url"] +
          "shopping_cart?ajax=1&action=refresh",
        success: function (data) {
          $(".cart-detailed-totals.js-cart-detailed-totals").replaceWith(
            data.cart_detailed_totals
          );
        },
      });
    }
  });

  // Email alert
  $(document).ajaxSuccess(function (event, xhr, settings) {
    if (
      settings.url ===
      document.location.origin + "/module/ps_emailalerts/actions?process=add"
    ) {
      const res = JSON.parse(xhr.responseText);
      console.log(res);
      const message = res.message
        .replace(
          "Your email address is invalid.",
          "Veuillez renseigner une adresse e-mail valide"
        )
        .replace(
          "You already have set an alert for this product.",
          "Vous avez déjà défini un alerte pour ce produit."
        );
      if (res.error) {
        $(".wx-mail-alert-modal:visible .wx-mailalert-alerts").html(`
                    <div class="flex items-center space-x-2">
                        <span class="w-5 h-5 rounded-full bg-red-500 flex items-center justify-center text-sm text-white">!</span>
                        <span class="text-sm text-red-500">${message}</span>
                    </div>
                `);
      } else {
        $(".wx-mail-alert-modal:visible .wx.js-mailalert").html(`
                    <div class="pt-4 pb-3">
                        <div class="flex items-center space-x-1 mb-2">
                            <span class="font-bold text-lbg-primary ">&check;</span>
                            <span class="text-lbg-primary">E-mail bien pris en compte</span>
                        </div>
                        <p class="font-medium">Dès que le produit sera à nouveau disponible, vous recevrez un e-mail de notification de notre part.</p>
                    </div>
                `);

        $(
          ".wx-mail-alert-modal div.js-mailalert > .js-mailalert-add, div.js-mailalert > input[type=email], div.js-mailalert .gdpr_consent_wrapper"
        ).show();
      }
    }
  });

  // Gestion du scroll pour les facettes
  $(document).ajaxSuccess(function (event, xhr, settings) {
    // console.log(event, xhr, settings);
    // console.log(xhr.responseJSON);
    // alert();
    // C'EST SCHADRAC , J'AI AJOUTER CE CODE  26/03/2024
    $(".ok").click(function () {
      $("#search_filters").hide();
      setTimeout(function () {
        window.location.reload();
      }, 200);
    });

    // const button = document.querySelector('.text-white.text-center.p-3.w-full.bg-lbg-primary');
    // if (button) {
    //     button.addEventListener('click', function() {
    //         // Code to apply filters
    //         $('#search_filters').hide();
    //         setTimeout(function() {
    //             window.location.reload();
    //         }, 200);
    //     });
    // } else {
    //     // console.error("Element not found.");
    // }

    // FIN DU CODE QUE J'AI RAJOUTER

    if (typeof xhr.responseJSON == "object") {
      if (xhr.responseJSON.rendered_products != undefined) {
        if (xhr.responseJSON.rendered_products.length > 0) {
          scrollToZone();
        }
      }

      // Si on ajoute un produit au panier
      // On rajoute un événement dans le dataLayer
      if (xhr.responseJSON.success != undefined) {
        if (
          xhr.responseJSON.success 
          && 
          xhr.responseJSON.quantity > 0 
          && 
          xhr.responseJSON.id_product_attribute >= 0
          && 
          xhr.responseJSON.id_product > 0
          && 
          xhr.responseJSON.errors.length == 0
        ) {
          // console.log(xhr.responseJSON);
          dataLayer.push({
            event: "addToCart",
            ecommerce: {
              add: {
                products: [
                  {
                    // name: "NOm du produit",
                    id: xhr.responseJSON.id_product,
                    // price: "1000",
                    // brand: "PrestaShop",
                    // Add more relevant product details as needed
                  },
                ],
              },
            },
          });
        }
      }
    }
  });

  // $(document).ajaxComplete(function(event, jqXHR, ajaxOptions) {
  //     alert();
  //     console.log(jqXHR.responseJSON);
  //     scrollToZone();
  //     console.log("bonjour les mec la niak ?");
  // });

  $(window).on("scroll", function () {
    $(".dropdown-menu").css("z-index", "99");
  });
});

$(document).ready(function () {
  $(".ok").click(function () {
    $("#search_filters").hide();
  });

  $("#search_filter_controls").click(function () {
    $("#search_filters").show();
  });
});

document.addEventListener("DOMContentLoaded", function () {
  var form = document.querySelector("#customStepForm"); // Sélectionnez votre formulaire par son ID

  if (form) {
    form.addEventListener("submit", function (event) {
      var emailInput = document.querySelector(
        'input[name="checkout_custom_step_email"]'
      );
      var emailValue = emailInput.value.trim();
  
      if (!emailValue) {
        event.preventDefault(); // Empêcher la soumission du formulaire
        emailInput.classList.add("border-red-500"); // Ajouter une classe pour indiquer le champ invalide
        emailInput.classList.remove("focus:border-green-500");
        setTimeout(function () {
          location.reload();
        }, 200);
      } else {
        emailInput.classList.remove("border-red-500"); // Retirer la classe si le champ est rempli
        emailInput.classList.add("focus:border-green-500");
      }
    });
  }
});

//Fin code

$(document).ready(function () {
  
  $(".view_waitinglist_modal").on("click", function (e) {
    e.preventDefault();
  
    const productId = $(this).data("id-product");
    const productIdAttribut = $(this).data("id-product-attribute");
  
    const buttonPopAvertir = $(".button-pop-up-avertir-by-email");
  
    buttonPopAvertir.attr("data-product", productId);
    buttonPopAvertir.attr("data-product-attribute", productIdAttribut);
  });
  
  $(".input-pop-up-avertir-by-email").on("input", function (e) {
    e.preventDefault();
    const saisie = $(this).val();
    const inputs = $(".input-pop-up-avertir-by-email");
    inputs.val(saisie);
  });
  
  $(".button_valider_form_choisir_mdp").on("click", function (e) {
    $(".text_mdp_non_valide_form_choisir_mdp").addClass("hidden");
  });
  
  $("form").submit(function (e) {
    // const password = $(".input_pass_valider_form_choisir_mdp").val();
    // // Expression régulière pour vérifier le mot de passe
    // const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$/;
    // // Vérifier si le mot de passe correspond à la regex
    // if (!regex.test(password)) {
    //   e.preventDefault();
    //   $(".text_mdp_non_valide_form_choisir_mdp").removeClass("hidden");
    //   return false;
    // }
    // // Si le mot de passe est valide, soumettre le formulaire
    // Récupérer la valeur du mot de passe
  
    const inputPassword = $(this).find('input[type="password"]');
  
    if (inputPassword && inputPassword.val() != undefined) {
      const textMdp = $(this).find(".text_mdp_non_valide_form_choisir_mdp");
  
      textMdp?.text("");
      if (textMdp && !textMdp.hasClass("hidden")) {
        textMdp.addClass("hidden");
      }
  
      const password = inputPassword.val();
      const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$/;
  
      if (!regex.test(password)) {
        e.preventDefault();
        textMdp?.text("Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule, un chiffre et un caractère spécial");
        textMdp?.removeClass("hidden");
        return false;
      }
    }
    // console.log("--- on arrive ici ---");
    return true;
  });
  
  // console.log($('input[type="password"]'));
  $('input[type="password"]').on('change keyup', function (e) {
  
    // alert();
    const inputPassword = $(this);
  
    if (inputPassword && inputPassword.val() != undefined) {
      let textMdp = $(this).parent().find(".text_mdp_non_valide_form_choisir_mdp");
      if (textMdp.length == 0) {
        textMdp = $(this).parents('[data-groupe="password"]').find(".text_mdp_non_valide_form_choisir_mdp");
      }
      // console.log(textMdp);
      textMdp?.text("");
      if (textMdp && !textMdp.hasClass("hidden")) {
        textMdp.addClass("hidden");
      }
  
      const password = inputPassword.val();
      const regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$/;
  
      if (!regex.test(password)) {
        e.preventDefault();
        textMdp?.text("Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule, un chiffre et un caractère spécial");
        textMdp?.removeClass("hidden");
        return false;
      }
    }
    // console.log("--- on arrive ici ---");
    return true;
  });
});

