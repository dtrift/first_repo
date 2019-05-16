puts "Как тебя зовут?"
name = gets.chomp.capitalize

puts "Какой у тебя рост (см)?"
height = gets.chomp.to_i

best_weight = height - 110

if best_weight > = 0
	puts "Привет #{ name }, твой идеальный вес #{ best_weight } кг"
else 
	puts "Привет #{ name }, твой вес уже оптимальный"
end
