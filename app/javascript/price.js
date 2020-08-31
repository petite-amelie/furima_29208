function calculation() {

  const price = document.getElementById("item-price")
  price.addEventListener('input', function() {
    // 手数料の計算
    let input_price = price.value
    let fee = input_price * 0.1
    // HTMLに手数料の値を渡す
    const output_fee = document.getElementById("add-tax-price")
    output_fee.textContent = fee
    // HTMLに利益の値を渡す
    let profit = input_price - fee
    const output_profit = document.getElementById("profit")
    output_profit.textContent = profit
  })
}

window.addEventListener('load', calculation)