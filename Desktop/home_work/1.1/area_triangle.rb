puts "Введите основание треугольника (см):"
base = gets.chomp.to_f

puts "Введитете высоту треугольника (см):"
height = gets.chomp.to_f

area_triangle = 0.5 * (base * height)

puts "Площадь треугольника равна #{ area_triangle } кв см" 
