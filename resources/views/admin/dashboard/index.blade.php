
@extends('admin.layout.master')

@section('title', 'Dashboard')

@section('body')

  <div class="app-main__inner">

    <h1>
      <i class="fas fa-chart-pie"></i>
      DASHBOARD
    </h1>


      <a class="btn btn-primary" href="./admin/dashboardDaily">DASHBOARD DAILY</a>
      


    <button class="btn btn-primary" style="margin-left: 80%;" id="exportButton">Export to CSV</button>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


    <canvas id="ordersChart" width="800" height="400"></canvas>

    <script>
          var ordersData = @json($orders);

          var months = [];
          var totals = [];

          ordersData.forEach(function(order) {
              months.push(order.month);
              totals.push(order.total);
          });

          var ctx = document.getElementById('ordersChart').getContext('2d');
          var chart = new Chart(ctx, {
              type: 'bar',
              data: {
                  labels: months,
                  datasets: [{
                      label: 'Number of Orders',
                      data: totals,
                      backgroundColor: 'rgba(75, 192, 192, 0.2)',
                      borderColor: 'rgba(75, 192, 192, 1)',
                      borderWidth: 1
                  }]
              },
              options: {
                  scales: {
                      y: {
                          beginAtZero: true,
                          precision: 0
                      }
                  }
              }
          });



          var data = [months, totals];

          // Export dữ liệu sang file CSV
          function exportToCSV() {
            var csvContent = "data:text/csv;charset=utf-8,";

            // Tiêu đề cột
            var headers = ["month", "number of bookings per month"];
            csvContent += headers.join(",") + "\n";

            // Dữ liệu từ mảng dữ liệu
              // Duyệt qua từng dòng dữ liệu trong mảng
              data.forEach(function (rowArray) {
              var row = rowArray.join(",");
              csvContent += row + "\r" + "\n";
            });


            // Tạo link tải về
            var encodedURI = encodeURI(csvContent);
            var link = document.createElement("a");
            link.setAttribute("href", encodedURI);
            link.setAttribute("download", "chart_data.csv");
            document.body.appendChild(link);

            // Kích hoạt sự kiện click để tải về
            link.click();
          }

          // Bắt sự kiện click vào nút Export to CSV
          var exportButton = document.getElementById("exportButton");
          exportButton.addEventListener("click", exportToCSV);


    </script>
  </div>

@endsection
