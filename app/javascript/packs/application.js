import "bootstrap";
import { markCategories } from '../components/category-button'
import { flipCard } from '../components/flip'
import '../components/menu-bar'
import '../components/close-bar'


const indexCategories = document.querySelector(".categories.index");
if (indexCategories) {
  markCategories();
};

const flipCards = document.querySelector(".cards");
if (flipCards) {
  flipCard();
};


require("chartkick").use(require("highcharts"))
