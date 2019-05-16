puts "Введите длину стороны а"
a = gets.chomp.to_f

puts "Введите длину стороны b"
b = gets.chomp.to_f

puts "Введите длину стороны с"
c = gets.chomp.to_f

a, b, max = [a, b, c].sort
right_triangle = a**2 + b**2 == max**2  
versatile_triangle = a != b && b != c && a != c  
isosceles_triangle = a == b && b == c && a == c  

if versatile_triangle
  puts "Треугольник с разными сторонами"
elsif isosceles_triangle
  puts "Треугольник равнобедренный и равносторонний, не прямоугольный"
elsif right_triangle && ( a == b )
  puts "Треугольник прямоугольный и равнобедренный"
else 
  puts "Треугольник равносторонний"
end
