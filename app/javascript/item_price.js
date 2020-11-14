window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const addtaxprice = document.getElementById("add-tax-price");
  const profit     = document.getElementById("profit");
  
  priceInput.addEventListener("input", () => {
    const price = priceInput.value ;
    addtaxprice.innerHTML = Math.floor(price * 0.1);
    profit.innerHTML =  Math.floor(price * 0.9);
  })
});
