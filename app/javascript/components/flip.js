function flipCard() {
  const answer = document.getElementById('answer');
  const flipButton = document.querySelector('.flip');
  const showElements = document.querySelectorAll('.show');
  const card = document.querySelector('.thecard');

  const arrayShow = Array.from(showElements);


  flipButton.addEventListener('click', () => {
    card.style = "transform: rotateY(180deg)";
    // arrayShow.forEach((element) => {
    //   element.style.display = 'inline'
    // });
    flipButton.style.display = 'none';
    // answer.disabled = 'true';
  });

}

export { flipCard } ;

