items = {}
su = []

loop do 
  puts "Введите 'стоп' в названии товара для завершения"
  puts "Введите название товара:"
  item = gets.chomp
  break if item == "стоп" 
  
  puts "Введите цену товара:"
  price = gets.chomp.to_f
  
  puts "Введите количество товара:"
  quantity = gets.chomp.to_f
  
  items.store(item, [price, quantity]) 
  a = price * quantity
  su << a
  puts "Стоимость #{ item } = #{ a }"
end
puts items
puts "Стоимость всех товаров в корзине - #{ su.sum }"
