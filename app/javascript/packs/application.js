// layout file, like app/views/layouts/application.html.erb
//= require xlsx

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

const file = '/home/fabricio/Documents/Parsing_cotações.xlsx'
const openFile = XLSX.read(file, {
      type: 'binary'
      });
console.log(openFile);
const XL_row_object = XLSX.utils.sheet_to_json(openFile.Sheets['Sheet1']);
//const json_object = JSON.stringify(XL_row_object);
console.log(XL_row_object);
//console.log(json_object);

const ExcelToJSON = function() {

  this.parseExcel = function(file) {
    const reader = new FileReader();

    reader.onload = function(e) {
      const data = e.target.result;
      const workbook = XLSX.read(data, {
        type: 'binary'
      });

      workbook.SheetNames.forEach(function(sheetName) {
        // Here is your object
        const XL_row_object = XLSX.utils.sheet_to_row_object_array(workbook.Sheets[sheetName]);
        const json_object = JSON.stringify(XL_row_object);
        console.log(json_object);

      })

    };

    reader.onerror = function(ex) {
      console.log(ex);
    };

    reader.readAsBinaryString(file);
  };
};

