<?php
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

if (!defined('_PS_VERSION_')) {
    exit;
}

function upgrade_module_1_5_0($object)
{
    // add position field at custom fields table
    $sql = 'ALTER TABLE `'._DB_PREFIX_.'advanced_custom_fields`
            ADD `position` int(10) unsigned NOT NULL';
    Db::getInstance()->execute($sql);




    // create relation table between custom fields and shops
    $sql = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'advanced_custom_fields_shops` (
                  `id_custom_field` int(10) unsigned NOT NULL,
                  `id_shop` int(10) unsigned NOT NULL,
                  PRIMARY KEY (`id_custom_field`,`id_shop`)
                ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8';
    Db::getInstance()->execute($sql);

    // keep existing configuration into the new relation field
    $sql = 'SELECT `id_custom_field`,`id_store`
            FROM `'._DB_PREFIX_.'advanced_custom_fields`';
    $res =  Db::getInstance()->ExecuteS($sql);
    // if result
    if ($res) {
        foreach ($res as $row) {
            // clear main table
            $sql = 'INSERT INTO `'._DB_PREFIX_.'advanced_custom_fields_shops`
                    (`id_custom_field`, `id_shop`)
                    VALUES
                    ('.(int)$row['id_custom_field'].', '.(int)$row['id_store'].')  ';
            Db::getInstance()->Execute($sql);
        }
    }

    // drop id_store field from custom fields table
    $sql = 'ALTER TABLE `'._DB_PREFIX_.'advanced_custom_fields`   DROP COLUMN `id_store` ';
    Db::getInstance()->Execute($sql);

    // register new hook
    $object->registerHook('actionAfterUpdateCategoryFormHandler');

    // return true
    return true;
}
