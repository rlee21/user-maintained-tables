var modal = document.querySelector('#product-modal');
var modalContent = document.querySelector('.close');
var products = {






}

function showModal() {
  modal.style.display = 'block';
}

function removeModal() {
  modal.style.display = 'none';
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = 'none';
  }
};
