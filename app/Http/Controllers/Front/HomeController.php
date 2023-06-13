<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Service\Blog\BlogServiceInterface;
use App\Service\Product\ProductServiceInterface;

class HomeController extends Controller
{
    private $productService;
    private $blogService;

    public function __construct (ProductServiceInterface $productServiceInterface,
                                BlogServiceInterface $blogService) {
        $this->productService = $productServiceInterface;
        $this->blogService = $blogService;
    }

    public function index () {
        $featuredProducts = $this->productService->getFeaturedProducts();
        $blogs = $this->blogService->getLatestBlogs(); 

        return view('front.index', compact('featuredProducts', 'blogs'));
    }
}
