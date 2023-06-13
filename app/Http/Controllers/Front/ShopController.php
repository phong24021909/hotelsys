<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\ProductComment;
use App\Service\Brand\BrandService;
use App\Service\Brand\BrandServiceInterface;
use App\Service\Product\ProductServiceInterface;
use App\Service\ProductCategory\ProductCategoryServiceInterface;
use Illuminate\Http\Request;

class ShopController extends Controller
{

    private $productService;
    private $productCategoryService;
    private $brandService;
    // $product = Product::findOrFail($id);
    public function __construct(ProductServiceInterface $productService,
                                ProductCategoryServiceInterface $productCategoryService,
                                BrandServiceInterface $brandService
                                ) {
        $this->productService = $productService;
        $this->productCategoryService = $productCategoryService;
        $this->brandService = $brandService;
        // dd($productCategoryService);
    }

    public function show($id) {

        $categories = $this->productCategoryService->all();
        $brands = $this->brandService->all();
        $product = $this->productService->find($id);
        $relatedProducts = $this->productService->getRelatedroduct($product);

        return view('front.shop.show', compact('product', 'relatedProducts', 'categories', 'brands'));
        dd($relatedProducts);
    }
    public function postComment (Request $request) {
        ProductComment::create($request->all());

        return redirect()->back();
    }

    public function index (Request $request) {


        $categories = $this->productCategoryService->all();
        $brands = $this->brandService->all();
        // dd($this->productCategoryService);
        $products = $this->productService->getProductOnIndex($request);

        return view('front.shop.index', compact('products', 'categories', 'brands'));
    }

    public function category($categoryName, Request $request) {
        $categories = $this->productCategoryService->all();
        // dd($this->productCategoryService);
        $brands = $this->brandService->all(); 
        // dd($brands);
        $products = $this->productService->getProductsByCategory($categoryName, $request);

        return view('front.shop.index', compact('products', 'categories', 'brands'));
    }

}


