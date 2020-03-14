function markCategories() {
  const selected_categories = document.querySelectorAll(".form-check");

  selected_categories.forEach(selected_category =>
      selected_category.addEventListener("click", (event) => {
      if (selected_category.children[0].checked === false){
        selected_category.children[0].checked = true;
        selected_category.classList.toggle("purple");

      } else {

        selected_category.children[0].checked = false;
        selected_category.classList.toggle("purple");
      }

    })
  );
}

export { markCategories } ;
