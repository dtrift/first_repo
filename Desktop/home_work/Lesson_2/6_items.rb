items = { }
arr = [ ]
cost_bascket = 0
cost_item = 0
loop do 
  puts "Введите стоп в названии товара для завершения"
  puts "Введите название товара:"
  item = gets.chomp
  break if item == "стоп"
  
  puts "Введите цену товара:"
  price = gets.chomp.to_f
  
  puts "Введите количество товара:"
  quantity = gets.chomp.to_f
  
  arr.push(price, quantity)
  items.store(item, arr)
  cost_item = price * quantity
  cost_bascket += cost_item
  puts "Стоимость #{ item } = #{ cost_item }"
  arr = [ ]
  puts items
  cost_bascket += price
  puts "Общая стоимость товаров в корзине #{ cost_bascket }"
end
  
  