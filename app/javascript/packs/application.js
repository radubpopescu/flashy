require("chartkick").use(require("highcharts"))
import "bootstrap";
import { markCategories } from '../components/category-button'
import { flipCard } from '../components/flip'
import { favoriteCategories } from '../components/favorite_category'
import '../components/menu-bar'
// import { openNav } from '../components/menu-bar'
// import { closeMenuBar } from '../components/menu-bar'


const indexCategories = document.querySelector(".categories.index");
if (indexCategories) {
  markCategories();
  favoriteCategories();
};

const flipCards = document.querySelector(".cards");
if (flipCards) {
  flipCard();
};

// const menuOpen = document.querySelectorAll('.toggle-menu-bar');
// if (menuOpen) {
//   closeMenuBar();
// };
