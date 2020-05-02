const modal = document.querySelector('#product-modal');
const modalContent = document.querySelector('.close');

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
// document.addEventListener('DOMContentLoaded', function() {
// });
