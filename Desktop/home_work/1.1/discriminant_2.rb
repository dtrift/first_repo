puts "Введите значение а"
a = gets.chomp.to_f

puts "Введите значение b"
b = gets.chomp.to_f

puts "Введите значение с"
c = gets.chomp.to_f

d = b**2 - 4 * a * c
k = Math.sqrt(d)
x = - b /(a * 2)
x1 = (- b + k)/(a * 2)
x2 = (- b - k)/(a * 2)

if d < 0
  puts "Корней нет"
elsif d == 0
  puts "Дискриминат d = #{ d }, корень уравнения x = #{ x }"
else
  puts "Дискриминант d = #{ d }, корень уравнения х1 = #{ x1 }, x2 = #{ x2 }"
end
 