<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductImage extends Model
{
    use HasFactory;

    /* Creating a table called product_images with a primary key of id and guarded is an array of
    attributes that you do not want to be mass assigned. */
    protected $table = 'product_images';
    protected $primaryKey = 'id';
    protected $guarded = [];

    public function products() {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }
}
