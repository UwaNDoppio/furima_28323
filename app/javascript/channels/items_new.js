window.addEventListener('load', function(){
  const price_field = document.getElementById("item-price")
    price_field.addEventListener("input", function(e){
       let fee = this.value / 10
       let appendfee = document.getElementById('add-tax-price');
       appendfee.textContent = fee
       let benefit = this.value - fee
       let appendbenefit = document.getElementById('profit')
       appendbenefit.textContent = benefit

  })
});