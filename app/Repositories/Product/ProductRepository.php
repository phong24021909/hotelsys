<?php

namespace App\Repositories\Product;

use App\Models\Product;
use App\Models\ProductCategory;
use App\Repositories\BaseRepositories;
use GuzzleHttp\Psr7\Request;

class ProductRepository extends BaseRepositories implements ProductRepositoryInterface {
    
    public function getModel() {
        return Product::class;
    }

    public function getRelatedroduct($product, $limit = 4) {
        return $this->model->where('product_category_id', $product->product_category_id)
            ->where('tag', $product->tag)
            ->limit($limit)
            ->get();
    }

    public function getFeaturedProductsByCategory (int $categoryId) {
        return $this->model->where('featured', true)
            ->where('product_category_id', $categoryId)
            ->get();
    }

    /**
     * This function returns a paginated list of products with a limit of 3 per page.
     * 
     * @return a paginated list of products with a limit of 3 products per page.
     */
    public function getProductOnIndex ($request) {
        
        $search = $request->search ?? '';

        $products = $this->model->where('name', 'like', '%' .$search .'%');
        $products = $this->filter($products, $request);
        $products = $this->sortAndPagination($products, $request);
        
        return $products;
    }

    public function getProductsByCategory ($categoryName, $request) {
        $products = ProductCategory::where('name', $categoryName)->first()->products->toQuery();
        $products = $this->filter($products, $request);
        $products = $this->sortAndPagination($products, $request);

        return $products;

    }

    private function sortAndPagination ($products, $request) {
        $perPage = $request->show ?? 3;
        $sortBy = $request->sort_by ?? 'latest';

        switch ($sortBy) {
            case 'latest':
                $products = $products->orderBy('id');
                break;
            case 'oldest':
                $products = $products->orderByDESC('id');
                break;
            case 'name-ascending':
                $products = $products->orderBy('name');
                break;
            case 'name-descending':
                $products = $products->orderByDESC('name');
                break;
            case 'price-ascending':
                $products = $products->orderBy('price');
                break;
            case 'price-descending':
                $products = $products->orderByDESC('price');
                break;
            default:
            $products = $products->orderBy('id');
        }

        $products = $products->paginate($perPage);
        $products->appends(['sort_by' => $sortBy, 'show' => $perPage]);
        return $products;
    }

    private function filter ($products, $request) {
        //Brand
        $brands = $request->brand ?? [];
        $brand_ids = array_keys($brands);
        $products = $brand_ids != null ? $products->where('brand_id', $brand_ids) : $products;

        //Price
        $priceMin = $request->price_min;
        $priceMax = $request->price_max;
        $priceMin = str_replace('$', '', $priceMin);
        $priceMax = str_replace('$', '', $priceMax);

        $products = ($priceMin != null && $priceMax != null) 
                    ? $products->whereBetween('price', [$priceMin, $priceMax]) : $products;
        
        // dd($priceMax);

        //Color
        $color = $request->color;
        $products = ($color != null)
                    ? $products->whereHas('productDetails', function($query) use ($color) {
                        return $query->where('color', $color)->where('qty', '>', 0);
                    }) : $products;

        //Size
        $size = $request->size;
        $products = ($size != null)
                    ? $products->whereHas('productDetails', function($query) use ($size) {
                        return $query->where('size', $size)->where('qty', '>', 0);
                    }) : $products;

        return $products;
    }
}