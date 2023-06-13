<?php

namespace App\Service\Product;

use App\Repositories\Product\ProductRepositoryInterface;
use App\Service\BaseService;

class ProductService extends BaseService implements ProductServiceInterface {
    
    public $repository;

    public function __construct(ProductRepositoryInterface $productrepository) {
        $this->repository = $productrepository;
    }

    /**
     * This PHP function finds a product by its ID and calculates its average rating based on its
     * associated comments.
     * 
     * @param id The parameter "id" is the identifier of the product that needs to be retrieved from
     * the repository.
     * 
     * @return a product object with an additional property "avgRating" which is the average rating of
     * all the product comments associated with the product.
     */
    public function find($id) {
        $product = $this->repository->find($id);
        $avgRating = 0;
        $sumRating = array_sum(array_column($product->productComments->toArray(), 'rating'));
        $countRating = count($product->productComments);
        if ($countRating != 0) {
            $avgRating = $sumRating / $countRating;
        }
        $product->avgRating = $avgRating;
        return $product;
    }

    public function getRelatedroduct($product, $limit = 4) {
        return $this->repository->getRelatedroduct($product, $limit);
    }

    public function getFeaturedProducts () {
        return [
            "Twin room" => $this->repository->getFeaturedProductsByCategory(1),
            "Single room" => $this->repository->getFeaturedProductsByCategory(2)
        ];
    }

    public function getProductOnIndex ($request) {
        return $this->repository->getProductOnIndex($request);
    }

    public function getProductsByCategory ($categoryName, $request) {
        return $this->repository->getProductsByCategory($categoryName, $request);
    }
}