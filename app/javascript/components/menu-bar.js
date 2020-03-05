document.getElementById('menu-bar').addEventListener('click', () => {
  openNav();
})
const openNav = () => {
  document.getElementById("sidebar").classList.toggle("navbar-toggler") ;
}
