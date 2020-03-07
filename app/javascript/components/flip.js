const flipButton = document.querySelector('#flip');
const iKnowButton = document.querySelector('#iknow');
const iDontKnowButton = document.querySelector('#idk');


flipButton.addEventListener('click', () => {
  flipButton.style.display = 'none';
  iKnowButton.style.display = 'inline';
  iDontKnowButton.style.display = 'inline';
});
