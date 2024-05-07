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

{extends file="helpers/form/form.tpl"}

{block name="label"}
	{$smarty.block.parent}
{/block}



{block name="input"}
	{if $input.type == 'groups'}
		{if count($input.values) && isset($input.values)}
			<div class="row">
				<div class="col-lg-6">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th class="fixed-width-xs">
									<span class="title_box">
										<input type="checkbox" name="checkme" id="checkme" onclick="checkDelBoxes(this.form, '{$input.name}[]', this.checked)" />
									</span>
								</th>
								<th class="fixed-width-xs"><span class="title_box">{l s='ID'}</span></th>
								<th>
									<span class="title_box">
										{l s='Shop name'}
									</span>
								</th>
							</tr>
						</thead>
						<tbody>
						{foreach $input.values as $key => $group}
							<tr>
								<td>
									{assign var=id_checkbox value=$input.name|cat:'_'|cat:$group['id_group']}
									<input type="checkbox" name="{$input.name}[]" class="groupBox" id="{$input.name}_{$group['id_group']}" value="{$group['id_group']}" {if $fields_value[$id_checkbox]}checked="checked"{/if} />
								</td>
								<td>{$group['id_group']}</td>
								<td>
									<label for="{$id_checkbox}">{$group['name']}</label>
								</td>
							</tr>
						{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		{else}
		<p>
			{l s='No group created'}
		</p>
		{/if}
	{else}
		{$smarty.block.parent}
	{/if}
{/block}
