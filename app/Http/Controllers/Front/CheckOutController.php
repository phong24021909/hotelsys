<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Service\Order\OrderServiceInterface;
use App\Service\OrderDetail\OrderDetailServiceInterface;
use App\Utilities\Constant;
use App\Utilities\VNPay;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;

class CheckOutController extends Controller
{
    private $orderService;
    private $orderDetailService;

    public function __construct (OrderServiceInterface $orderService,
                                OrderDetailServiceInterface $orderDetailService) {
        $this->orderService = $orderService;
        $this->orderDetailService = $orderDetailService;
    }

    public function index () {

        $carts = Cart::content();
        $total = Cart::total();
        $subtotal = Cart::subtotal();

        return view('front.checkout.index', compact('carts', 'total', 'subtotal'));
    }

    public function addOrder (Request $request) {
        //1. Thêm đơn hàng
        $data = $request->all();
        $data['status'] = Constant::order_status_ReceiveOrders;
        $order = $this->orderService->create($data);

        //2. Thêm chi tiết đơn hàng
        $carts = Cart::content();
        foreach ($carts as $cart) {
            $data = [
                'order_id' => $order->id,
                'product_id' => $cart->id,
                'qty' => $cart->qty,
                'amount' => $cart->price,
                'total' => $cart->qty * $cart->price,
            ];
            $this->orderDetailService->create($data);
        }

        if($request->payment_type == 'pay_later') {
            //3. Xoá giỏ hàng
            Cart::destroy();
    
            //4. Trả kq + thông báo
            return redirect('checkout/result')
                    ->with('notification', 'Đặt hàng thành công. Hãy kiểm tra email của bạn');

        }

        if($request->payment_type == 'online_payment') {
            // lay url thanh toan vnpay
            $data_url = VNPay::vnpay_create_payment([
                'vnp_TxnRef' => $order->id,
                'vnp_OrderInfo' => 'descriptions',
                'vnp_Amount' => Cart::total(0, '', '') * 23455,
            ]);
            // chuyen huong toi url lay dc
            return redirect()->to($data_url);
        } else {
            return "Online Payment is not support";
        }

    }

    public function vnPayCheck (Request $request) {
        // lay data tu url(vnPay gui ve qua $data_url)

        $vnp_ResponseCode = $request->get('vnp_ResponseCode');
        $vnp_TxnRef = $request->get('vnp_TxnRef');
        $vnp_Amount = $request->get('vnp_Amount');

        //ktra data xem kq tra ve hop le khong

        if($vnp_ResponseCode != null) {
            if($vnp_ResponseCode == 00) {

                $this->orderService->update([
                    'status' => Constant::order_status_Paid,
                ], $vnp_TxnRef);

                // xoa cart
                Cart::destroy();

                //kq
                return redirect('checkout/result')
                    ->with('notification', 'Đặt hàng thành công. Hãy kiểm tra email của bạn');
            } else {
                // xoa don da them vao database
                $this->orderService->delete($vnp_TxnRef);

                return redirect('checkout/result')
                    ->with('notification', 'Đặt hàng không thành công.');
            }
        }
    }

    public function result () {
        $notification = session('notification');
        return view('front.checkout.result', compact('notification'));
    }

}
