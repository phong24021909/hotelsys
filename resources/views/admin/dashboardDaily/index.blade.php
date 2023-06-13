
@extends('admin.layout.master')

@section('title', 'Dashboard')

@section('body')

  <div class="app-main__inner">

    <h1>
        <i class="fas fa-chart-pie"></i>
        DASHBOARD DAILY
      </h1>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <canvas id="ordersChart"></canvas>

    <script>
        var chartData = {!! $chartData !!};

        var ctx = document.getElementById('ordersChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: generateDates(),
                datasets: generateDatasets(chartData)
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        stepSize: 1
                    }
                }
            }
        });

        function generateDates() {
            var dates = [];
            var daysInMonth = new Date().getDate();
            for (var i = 1; i <= daysInMonth; i++) {
                dates.push(i);
            }
            return dates;
        }

        function generateDatasets(data) {
            var datasets = [];
            for (var i = 0; i < data.length; i++) {
                datasets.push({
                    label: 'Month ' + (i + 1),
                    data: data[i],
                    borderColor: getRandomColor(),
                    fill: false
                });
            }
            return datasets;
        }

        function getRandomColor() {
            var letters = '0123456789ABCDEF';
            var color = '#';
            for (var i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }
    </script>
  </div>

@endsection
