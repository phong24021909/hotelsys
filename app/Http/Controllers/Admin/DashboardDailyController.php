<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardDailyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
{
    $startMonth = 1;
    $endMonth = Carbon::now()->month;
    $currentYear = Carbon::now()->year;

    $months = range($startMonth, $endMonth);

    $chartData = [];
    foreach ($months as $month) {
        $daysInMonth = Carbon::create($currentYear, $month)->daysInMonth;

        $monthlyData = [];
        for ($day = 1; $day <= $daysInMonth; $day++) {
            $ordersCount = Order::whereYear('created_at', $currentYear)
                ->whereMonth('created_at', $month)
                ->whereDay('created_at', $day)
                ->count();

            $monthlyData[] = $ordersCount;
        }

        $chartData[] = $monthlyData;
    }

    return view('admin.dashboardDaily.index')->with('chartData', json_encode($chartData));
}

    

    


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
