window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTax = inputValue * 0.1
    addTaxDom.innerHTML = Math.floor(addTax)
    const profitDom = document.getElementById("profit");
    profit = inputValue - addTax
    profitDom.innerHTML = Math.floor(profit)
  })
});
