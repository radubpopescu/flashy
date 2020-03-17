import "bootstrap";
import { markCategories } from '../components/category-button'
import { flipCard } from '../components/flip'
import { favoriteCategories } from '../components/favorite_category'
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


require("chartkick").use(require("highcharts"))
