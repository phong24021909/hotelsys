@extends('front.layout.master')

@section('title', 'Home')

@section('body')
    
    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg" data-setbg="front/img/hero-1.jpg">
                
            </div>
            <div class="single-hero-items set-bg" data-setbg="front/img/hero-2.jpg">
                
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Banner Section Begin -->
    <div class="banner-section spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="front/img/banner-1.jpg" alt="">
                        <div class="inner-text">
                            <h4>Single room</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="front/img/banner-2.jpg" alt="">
                        <div class="inner-text">
                            <h4>Twin room</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner">
                        <img src="front/img/banner-3.jpg" alt="">
                        <div class="inner-text">
                            <h4>Double room</h4>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Banner Section End -->

    <!-- Women Banner Section Begin -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg" data-setbg="front/img/products/large-1.jpg">
                        <h2>Twin Room</h2>
                        <a href="#">Discover More</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    
                    <div class="product-slider owl-carousel women">
                        @foreach ($featuredProducts['Twin room'] as $product)
                            @include('front.components.product-item')
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Women Banner Section End -->

    <!-- Men Banner Section Begin -->
    <section class="man-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 offset-lg-1" style=" margin-right: 8.333333333%; margin-left: 0;">
                    
                    <div class="product-slider owl-carousel men">
                        @foreach ($featuredProducts['Single room'] as $product)
                        @include('front.components.product-item')
                        @endforeach
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="product-large set-bg" data-setbg="front/img/products/large-2.jpg">
                        <h2>Single Room</h2>
                        <a href="#">Discover More</a>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- Men Banner Section End -->


@endsection
