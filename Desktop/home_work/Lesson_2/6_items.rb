items = {}
has = {}

loop do 
  puts "Введите 'стоп' в названии товара для завершения"
  puts "Введите название товара:"
  item = gets.chomp
  break if item == "стоп"
  
  puts "Введите цену товара:"
  price = gets.chomp.to_f
  
  puts "Введите количество товара:"
  quantity = gets.chomp.to_f
  
  has.store(price, quantity)
  items.store(item, has)
  puts "Стоимость #{ item } = #{ price * quantity }"
  puts items
  items = { }
  has.each do | price, quantity |
    puts (quantity * price) + (quantity * price) 
  end
end
 