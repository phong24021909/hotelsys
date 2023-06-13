<?php

namespace App\Service\Product;

use App\Service\ServiceInterface;

interface ProductServiceInterface extends ServiceInterface {
    public function getRelatedroduct($product, $limit = 4);
    public function getFeaturedProducts();
    public function getProductOnIndex ($request);
    public function getProductsByCategory ($categoryName, $request);
}