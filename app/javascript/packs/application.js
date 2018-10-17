// layout file, like app/views/layouts/application.html.erb

// const echarts = require('echarts');
// // initialize echarts instance with prepared DOM
// const myChart = echarts.init(document.getElementById('main'));
// // draw chart
// myChart.setOption({
//     xAxis: {
//         data: ['2017-10-24', '2017-10-25', '2017-10-26', '2017-10-27']
//     },
//     yAxis: {},
//     series: [{
//         type: 'k',
//         data: [
//             [20, 30, 10, 35],
//             [40, 35, 30, 55],
//             [33, 38, 33, 40],
//             [40, 40, 32, 42]
//         ]
//     }]
// });

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['Mon', 20, 28, 38, 45],
      ['Tue', 31, 38, 55, 66],
      ['Wed', 50, 55, 77, 80],
      ['Thu', 77, 77, 66, 50],
      ['Fri', 68, 66, 22, 15]
      // Treat first row as data as well.
    ], true);

    var options = {
      legend:'none'
    };

    var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

    chart.draw(data, options);
  }
