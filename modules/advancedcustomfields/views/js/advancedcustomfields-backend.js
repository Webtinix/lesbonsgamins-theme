/**
*
*
*    Advanced Custom Fields
*    Copyright 2018  Inno-mods.io
*
*    @author    Inno-mods.io
*    @copyright Inno-mods.io
*    @version   1.5
*    Visit us at http://www.inno-mods.io
*
*
**/
(function($) {
  "use strict";
  $(document).ready(function(){
    // run once on load
    showLocationHooks($('#advancedcustomfields #location').val());

    // init an on change event
    $('#advancedcustomfields #location').change(function(){
        // show location hooks
        showLocationHooks($(this).val());
    });

    // showLocationHooks
    function showLocationHooks(location)
    {
      // for product
      if (location=='product'){
        // show
        $('.form-group.admin-product-hook-option').show();
        $('.form-group.display-frontend-options').show();
        $('.form-group.type-admin-form-option').show();
        // hide
        $('.form-group.required-option').hide();
        $('.form-group.editable-frontend-option').hide();
        $('.form-group.type-frontend-form-option').hide();
        $('.form-group.type-admin-customer-form-option').hide();
        // trigger a change in the field type dropdwon
        $('#type_admin_form').trigger('change');
      }
      // for category
      if (location=='category'){
        // show
        $('.form-group.required-option').show();
        $('.form-group.display-frontend-options').show();
        $('.form-group.type-admin-form-option').show();
        // hide
        $('.form-group.editable-frontend-option').hide();
        $('.form-group.admin-product-hook-option').hide();
        $('.form-group.type-frontend-form-option').hide();
        $('.form-group.type-admin-customer-form-option').hide();
        // trigger a change in the field type dropdwon
        $('#type_admin_form').trigger('change');
      }
      // for customer
      if (location=='customer'){
        // hide
        $('.form-group.admin-product-hook-option').hide();
        $('.form-group.type-admin-form-option').hide();
        $('.form-group.translatable-option').hide();
        $('#translatable_on').prop("checked", false);
        $('#translatable_off').prop("checked", true);
        // show
        $('.form-group.required-option').show();
        $('.form-group.editable-frontend-option').show();

        // show field types according to editable option
        if ($('#advancedcustomfields #editable_frontend_on').is(':checked')){
          $('.form-group.type-admin-form-option').hide();
          $('.form-group.type-frontend-form-option').show();
          $('.form-group.type-admin-customer-form-option').hide();
        }
        if ($('#advancedcustomfields #editable_frontend_off').is(':checked')){
          $('.form-group.type-admin-form-option').hide();
          $('.form-group.type-frontend-form-option').hide();
          $('.form-group.type-admin-customer-form-option').show();
        }
      }

    }

    // get field types if editable option changed
    $('#advancedcustomfields input[name=editable_frontend]').click(function(){
      // if editable on
      if ($('#advancedcustomfields input[name=editable_frontend]:checked').val() == 1){
        $('.form-group.type-admin-form-option').hide();
        $('.form-group.type-admin-customer-form-option').hide();
        $('.form-group.type-frontend-form-option').show();
      }
      // if editable off
      if ($('#advancedcustomfields input[name=editable_frontend]:checked').val() == 0){
        $('.form-group.type-admin-form-option').hide();
        $('.form-group.type-frontend-form-option').hide();
        $('.form-group.type-admin-customer-form-option').show();
      }
    });







    // run once on load
    if ($('#advancedcustomfields #type_frontend_form').is(":visible")){
        showFieldOptions($('#advancedcustomfields #type_frontend_form').val());
    }
    if ($('#advancedcustomfields #type_admin_form').is(":visible")){
        showFieldOptions($('#advancedcustomfields #type_admin_form').val());
    }
    if ($('#advancedcustomfields #type_admin_form_customer').is(":visible")){
        showFieldOptions($('#advancedcustomfields #type_admin_form_customer').val());
    }

    // init an on change event
    $('#advancedcustomfields #type_admin_form').change(function(){
        // show location hooks
        showFieldOptions($(this).val());
    });
    // init an on change event
    $('#advancedcustomfields #type_frontend_form').change(function(){
        // show location hooks
        showFieldOptions($(this).val());
    });
    // init an on change event
    $('#advancedcustomfields #type_admin_form_customer').change(function(){
        // show location hooks
        showFieldOptions($(this).val());
    });

    // showFieldOptions
    function showFieldOptions(fieldType)
    {
      // translatable option
      if (fieldType == 'text' || fieldType == 'textarea' || fieldType == 'editor'){
        if ($('#location').val()=='customer'){
          $('.form-group.translatable-option').hide();
        } else {
          $('.form-group.translatable-option').show();
        }
      } else {
        $('.form-group.translatable-option').hide();
      }
      // available & default values options
      if (fieldType == 'checklist' || fieldType == 'select' || fieldType == 'radio'){
        $('.form-group.available-values-option').show();
        $('.form-group.default-value-option').show();
      } else {
        $('.form-group.available-values-option').hide();
        $('.form-group.default-value-option').hide();
      }
      // allow empty option for select fields
      if (fieldType == 'select'){
        $('.form-group.allow-empty-select-option').show();
      } else {
        $('.form-group.allow-empty-select-option').hide();
      }

      // default & default values options
      if (fieldType == 'checkbox' || fieldType == 'switch'){
        $('.form-group.default-status-option').show();
      } else {
        $('.form-group.default-status-option').hide();
      }
      // default & default values options
      if (fieldType == 'checkbox'){
        $('.form-group.single-label-option').show();
      } else {
        $('.form-group.single-label-option').hide();
      }
      // default status option
      if($('#advancedcustomfields #location').val()!='product'){
        if (fieldType == 'switch'){
          $('.form-group.required-option').hide();
        } else {
          $('.form-group.required-option').show();
        }
      }
    }


    /*
    * upload image for product edit screen
    */
    $('body').on("change", ".acf-image .acf-image-input",function(e){
      e.preventDefault();
      // get custom field wrapper
      var imageWrapper = $(this).closest('.acf-image').attr('id');
      // check that we are in an idle condition
      if (!$("#"+imageWrapper).hasClass('uploading')){
        // add an uploading status
        $("#"+imageWrapper).addClass('uploading');
        // prepare ajax request options
        var image = $(this).prop("files")[0];
        var formData = new FormData();
        formData.append("file", image);
        formData.append("name", $(this).closest('.acf-image').attr('data-custom-field'));
        formData.append("id", $('#form_id_product').val());
        formData.append("ajax", 1);
        // make the ajax request
        $.ajax({
                type: 'post',
                url: AcfUploadController,
                data : formData,
                contentType: false,
                cache: false,
                processData: false,
                dataType: 'json',
                success : function(response){
                    // show thumbnail
                    $("#"+imageWrapper+" figure .currentImage").html(response.image);
                    // show filesize
                    $("#"+imageWrapper+" figure .fileSize").html(response.fileSize);
                    // display thumbnail wrapper
                    $("#"+imageWrapper+" figure").show();
                    // remove uploading class
                    $("#"+imageWrapper).removeClass('uploading');
                }
        });
      }
    });


    /*
    * delete image for product edit screen
    */
    $('body').on("click", ".deleteProductImage",function(e){
      e.preventDefault();
      // get custom field wrapper
      var imageWrapper = $(this).closest('.acf-image').attr('id');
      // make the ajax delete request
      $.ajax({
              type: 'get',
              url: AcfDeleteProductImageController,
              data: {
                    name: $(this).closest('.acf-image').attr('data-custom-field'),
                    objectId: $('#form_id_product').val()
                    },
              success : function(response){
                    // unset thumbnail
                    $("#"+imageWrapper+" figure .currentImage").html('');
                    // unset filesize
                    $("#"+imageWrapper+" figure .fileSize").html('0');
                    // hide wrapper
                    $("#"+imageWrapper+" figure").hide();
                  }
              });
    });


    /*
    * delete image for category edit screen
    */
    $('body').on("click", ".deleteCategoryImage",function(e){
      e.preventDefault();
      // get thumbnail wrapper
      var thumbnailId = $(this).closest('figure').attr('id');
      // make the ajax request
      $.ajax({
              type: 'get',
              url: AcfDeleteCategoryImageController,
              data: {
                    name: $('#'+thumbnailId).attr('data-custom-field'),
                    objectId: $('#'+thumbnailId).attr('data-category-id')
                    },
              success : function(response){
                    // assign label to the input
                    $('#category_'+$('#'+thumbnailId).attr('data-custom-field')).closest('.form-group').find('.form-control-label').html($('#'+thumbnailId).attr('data-custom-field-label'));
                    // remove thumbnail
                    $('#'+thumbnailId).closest('.form-group.type-custom_content').remove();
                  }
              });
    });



  });
})(jQuery);
