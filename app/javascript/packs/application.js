import "bootstrap";
import { markCategories } from '../components/category-button'
import { favoriteCategories } from '../components/favorite-category'
import { flipCard } from '../components/flip'
import '../components/menu-bar'
import '../components/close-bar'


const indexCategories = document.querySelector(".categories.index");
if (indexCategories) {
  markCategories();
  favoriteCategories();
};

const flipCards = document.querySelector(".cards");
if (flipCards) {
  flipCard();
};


require("chartkick").use(require("highcharts"));

