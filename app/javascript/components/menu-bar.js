/* Set the width of the sidebar to 250px and the left margin of the page content to 250px */
document.getElementById('menu-bar-open').addEventListener('click', () => {
  openNav();
});
const openNav = () => {
  document.getElementById("mySidebar").classList.toggle("toggle-menu-bar") ;
};

/* Set the width of the sidebar to 0 and the left margin of the page content to 0 */


document.querySelector('toggle-menu-bar').addEventListener('click', () => {
  closeMenuBar();
};

const closeMenuBar = () => {
  classList.remove('toggle-menu-bar');
};


