puts "Введите значение а"
a = Float(gets.chomp)

puts "Введите значение b"
b = Float(gets.chomp)

puts "Введите значение с"
c = Float(gets.chomp)

d = b**2-4*a*c

if d<0
puts "Корней нет"

elsif d==0
x = -b/(2*a)
puts "Дискриминат равен #{d}, корень уравнения x=#{x}"

else 
x1 = (-b+Math.sqrt(d))/(2*a)
x2 = (-b-Math.sqrt(d))/(2*a)
puts "Дискриминант равен #{d}, корень уравнения х1=#{x1}, x2=#{x2}"

end
