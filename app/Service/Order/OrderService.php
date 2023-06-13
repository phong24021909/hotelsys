<?php

namespace App\Service\Order;

use App\Service\BaseService;
use App\Repositories\Order\OrderRepositoryInterface;

class OrderService extends BaseService implements OrderServiceInterface {
    public $repository;

    public function __construct(OrderRepositoryInterface $OrderRepository) {
        $this->repository = $OrderRepository;
    }
}