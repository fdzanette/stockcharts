// layout file, like app/views/layouts/application.html.erb

const echarts = require('echarts');
// initialize echarts instance with prepared DOM
const myChart = echarts.init(document.getElementById('main'));
// draw chart
myChart.setOption({
    xAxis: {
        data: ['2017-10-24', '2017-10-25', '2017-10-26', '2017-10-27']
    },
    yAxis: {},
    series: [{
        type: 'k',
        data: [
            [20, 30, 10, 35],
            [40, 35, 30, 55],
            [33, 38, 33, 40],
            [40, 40, 32, 42]
        ]
    }]
});
