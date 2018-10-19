//import "bootstrap";

const btnStrategy = document.getElementById('set');
const stockClose = document.querySelectorAll('.stock_close');
const stockExpoAverage = document.querySelectorAll('.expo_average');


btnStrategy.addEventListener('click', (event) => {
  let i = 0;
  stockClose.forEach((close) => {
    if (close.innerText < stockExpoAverage[i].innerText) {
      close.classList.toggle('sell');
    } else if (close.innerText > stockExpoAverage[i].innerText){
      close.classList.toggle('buy');
    };
    console.log(stockExpoAverage[i].innerText);
    //console.log(stockExpoAverage[i].innerHTML);
    i += 1
  });
});
