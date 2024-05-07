{*
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
*}
<div class="col-md-12" style="padding-left: 15px; padding-right: 15px;">
    <div class="card">
      	<h3 class="card-header">
      		<i class="material-icons">person</i> {l s='Additional Customer Info' mod='advancedcustomfields'}
      	</h3>
      	<div class="card-body">
        	  <div class="row">
        		    <div class="col-xs-12 col-sm-4">
                    <span class="acf-customer-info">{l s='Editable fields' mod='advancedcustomfields'}</span>
                    {foreach from=$editableCustomFields item=customField}
                        <div class="row">
                						<label class="control-label col-lg-4">{$customField['name']}:</label>
                						<div class="col-lg-7">
            							       <p class="form-control-static">
                                   {if $customField['value']=='acf-checked'}
                                      <i class="material-icons">check</i>
                                   {else if $customField['value']=='acf-not-checked'}
                                      <i class="material-icons">remove</i>
                                   {else}
                                      {$customField['value']}
                                   {/if}
                                 </p>
                						</div>
              					</div>
                    {/foreach}
        		     </div>
                 <div class="col-xs-12  col-sm-4">
                     <span class="acf-customer-info">{l s='Public fields' mod='advancedcustomfields'}</span>
                     {foreach from=$publicCustomFields item=customField}
                         <div class="row">
                 						<label class="control-label col-lg-4">{$customField['name']}:</label>
                 						<div class="col-lg-7">
             							       <p class="form-control-static">
                                    {if $customField['value']=='acf-checked'}
                                       <i class="material-icons">check</i>
                                    {else if $customField['value']=='acf-not-checked'}
                                       <i class="material-icons">remove</i>
                                    {else}
                                       {$customField['value']}
                                    {/if}
                                  </p>
                 						</div>
               					</div>
                     {/foreach}
         		     </div>
                 <div class="col-xs-12  col-sm-4">
                     <span class="acf-customer-info">{l s='Admin only fields' mod='advancedcustomfields'}</span>
                     {foreach from=$adminOnlyCustomFields item=customField}
                         <div class="row">
                 						<label class="control-label col-lg-4">{$customField['name']}:</label>
                 						<div class="col-lg-7">
             							       <p class="form-control-static">
                                    {if $customField['value']=='acf-checked'}
                                       <i class="material-icons">check</i>
                                    {else if $customField['value']=='acf-not-checked'}
                                       <i class="material-icons">remove</i>
                                    {else}
                                       {$customField['value']}
                                    {/if}
                                  </p>
                 						</div>
               					</div>
                     {/foreach}
         		     </div>
        	   </div>
        </div>
    </div>
</div>
