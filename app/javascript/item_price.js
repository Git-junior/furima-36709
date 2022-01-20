window.addEventListener('load', function() {

  const priceInput = document.getElementById("item-price");
  const addTaxDom = this.document.getElementById("add-tax-price");
  const profitDom = this.document.getElementById("profit");

  priceInput.addEventListener('input', function() {
    const inputValue = priceInput.value;
    
    const addTax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = addTax;

    profitDom.innerHTML = inputValue - addTax;
  });
});
