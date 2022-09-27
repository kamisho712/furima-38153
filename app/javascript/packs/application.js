window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener("input", () => {
    addTaxPrice.innerHTML = Math.round(itemPrice.value * 0.1 );
    profit.innerHTML = Math.round(itemPrice.value - Math.round(itemPrice.value * 0.1 ));
  });
});