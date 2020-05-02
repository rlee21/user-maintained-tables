var modal = document.querySelector('#product-modal');
var modalContent = document.querySelector('.close');
var productDescription = document.querySelector('.product-description');

function showModal(product) {
  modal.style.display = 'block';
  updateProductDescription(product);
}

function updateProductDescription(product) {
  productDescription.innerHTML = `
    ${product.status}<br>
    Name: ${product.name}<br>
    Description: ${product.description}<br>
    Price: ${product.price}
  `;
}
function removeModal() {
  modal.style.display = 'none';
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = 'none';
  }
};
