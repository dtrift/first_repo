months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
 
puts "Введите день: " 
day = gets.chomp.to_i 
 
puts "Введите месяц: " 
month = gets.chomp.to_i 
 
puts "Введите год: " 
year = gets.chomp.to_i 
 
if year % 4 == 0 && year % 100 != 0 
  puts "#{ year } високосный год"
  months[1] = 29 
end 

a = months.take(month - 1).sum
puts "Порядковый номер даты #{ day }.#{ month }.#{ year } - #{ a + day }"
