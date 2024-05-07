<?php
require_once _PS_MODULE_DIR_.'everpsgift/models/EverPsGiftClass.php';

class EverpsgiftOveride extends Everpsgift
{

    public function hookActionOrderStatusUpdate($params)
    {
        if (isset($params['order'])) {
            $order = new Order(
                (int)$params['order']->id
            );
        } else {
            $order = new Order(
                (int)$params['id_order']
            );
        }
        if (isset($params['newOrderStatus'])) {
            $orderStatus = $params['newOrderStatus'];
        } else {
            $orderStatus = $params['orderStatus'];
        }
        $cart = new Cart(
            (int)$order->id_cart
        );
        $cart_products = $cart->getProducts();
        if (empty($cart_products)) {
            return;
        }
        $gift_product = new Product(
            (int)Configuration::get('EVERPSGIFT_PRODUCT')
        );
        if (Validate::isLoadedObject($order)) {
            if ($orderStatus->id == (int)Configuration::get('GIFTVOUCHER_VALIDATION')) {
                foreach ($cart_products as $product) {
                    if ($product['id_product'] == $gift_product->id) {
                        $sql = new DbQuery();
                        $sql->select('quantity');
                        $sql->from(
                            'cart_product'
                        );
                        $sql->where(
                            'id_product = '.(int)$product['id_product']
                        );
                        $sql->where(
                            'id_product_attribute = '.(int)$product['id_product_attribute']
                        );
                        if ($this->isSeven) {
                            $sql->where(
                                'id_customization = '.(int)$product['id_customization']
                            );
                        }
                        $sql->where(
                            'id_cart = '.(int)$order->id_cart
                        );
                        $qty = Db::getInstance()->getValue($sql);
                        if ($qty > 0) {
                            // for ($i=1; $i < $qty; $i++) { 
                                $gift = new EverPsGiftClass();
                                $gift->id_customer = $cart->id_customer;
                                $gift->id_order = $order->id;
                                $gift->id_product = $product['id_product'];
                                $gift->id_product_attribute = $product['id_product_attribute'];
                                $gift->id_customization = $product['id_customization'];
                                if ((bool)Configuration::get('GIFTVOUCHER_TAX') === true) {
                                    $price = Product::getPriceStatic(
                                        $product['id_product'],
                                        true,
                                        $product['id_product_attribute']
                                    );
                                } else {
                                    $price = Product::getPriceStatic(
                                        $product['id_product'],
                                        false,
                                        $product['id_product_attribute']
                                    );
                                }
                                $gift->amount = $price;
                                $gift->validity_duration = (int)Configuration::get(
                                    'GIFTVOUCHER_DURATION'
                                );
                                $gift->save();
                            // }
                        }
                    }
                }
            }
            if ($orderStatus->id == (int)Configuration::get('GIFTVOUCHER_CANCEL')) {
                $exists = EverPsGiftClass::getByIdOrder(
                    (int)$order->id
                );
                if ($exists) {
                    $return = false;
                    foreach ($exists as $exist) {
                        $voucher = new EverPsGiftClass(
                            (int)$exist['id_everpsgift']
                        );
                        if ($voucher->deleteCartRule()
                            && $voucher->delete()
                        ) {
                            $return = true;
                        }
                    }
                    return (bool)$return;
                }
            }
        }
    }


    public function registerDisplayMyAccountBlockHook()
	{
		return $this->registerHook('displayMyAccountBlock');
	}

    public function hookDisplayMyAccountBlock()
    {
        $this->context->smarty->assign(array(
            'evergift_dir' => $this->_path,
            'is_seven' => $this->isSeven,
        ));
        return $this->display(__FILE__, 'views/templates/front/myaccount.tpl');
    }
}
