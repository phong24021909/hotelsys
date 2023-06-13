<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Service\Product\ProductServiceInterface;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;

class CartController extends Controller
{
    private $productService;

    public function __construct(ProductServiceInterface $productService)
    {
        $this->productService = $productService;
    }

    public function index () {
        $carts = Cart::content();
        $total = Cart::total();
        $subtotal = Cart::subtotal();
        // dd($carts);

        return view('front.shop.cart', compact('carts', 'total', 'subtotal'));
    }

    /**
     * The function adds a product to the cart and returns the updated cart information.
     * 
     * @param Request request  is an instance of the Request class which contains the data sent
     * by the client in the HTTP request. It is used to retrieve data from the request such as form
     * data, query parameters, and request headers. In this code, it is used to retrieve the productId
     * sent in the AJAX request.
     * 
     * @return If the request is an AJAX request, an array containing the updated cart information
     * (including the added product, the count of items in the cart, and the total price of the cart)
     * is returned. If the request is not an AJAX request, the user is redirected back to the previous
     * page.
     */
    public function add(Request $request) {
        if($request->ajax()) {
            $product = $this->productService->find($request->productId);
    
            $response['cart'] = Cart::add([
                'id' => $product->id,
                'name' => $product->name,
                'qty' => 1,
                'price' => $product->discount ?? $product->price,
                'weight' => $product->weight ?? 0,
                'options' => [
                    'images' => $product->productImages,
                ],
            ]);

            $response['count'] = Cart::count();
            $response['total'] = Cart::total();

            return $response;
        }

        // var_dump(Cart::content());
        // die();

        return back();
    }

    public function delete(Request $request) {
        if($request->ajax()) {
            $response['cart'] = Cart::remove($request->rowId);
            $response['count'] = Cart::count();
            $response['total'] = Cart::total();
            $response['subtotal'] = Cart::subtotal();
    
            return $response;
        }
        return back();
    }

    public function destroy() {
        Cart::destroy();
    }

    public function update(Request $request) {
        if($request->ajax()) {
            $response['cart'] = Cart::update($request->rowId, $request->qty);
            $response['count'] = Cart::count();
            $response['total'] = Cart::total();
            $response['subtotal'] = Cart::subtotal();
    
            return $response;
        }
        // return back();
    }
}
