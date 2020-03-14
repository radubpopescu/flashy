function favoriteCategories() {
  const selected_categories = document.querySelectorAll(".form-check");

  function markChecked(selected_category) {
    if (selected_category.children[0].checked) {
      selected_category.classList.add("purple");
      // selected_category.children[1].setAttribute("style", "color: white; z-index: 9;");
    }
  }

  selected_categories.forEach(selected_category => markChecked(selected_category));
}

export { favoriteCategories } ;

