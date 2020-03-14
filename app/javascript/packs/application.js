require("chartkick").use(require("highcharts"))
import "bootstrap";
import '../components/menu-bar'
import { markCategories } from '../components/category-button'
import '../components/flip'
import '../components/menu-bar'

import { favoriteCategories } from '../components/favorite_category'

const indexCategories = document.querySelector(".categories.index");

if (indexCategories) {
  markCategories();
  favoriteCategories();
}






