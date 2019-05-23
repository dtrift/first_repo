months = { 
           1 => 31 ,
           2 => 28,
           3 => 31,
           4 => 30,
           5 => 31,
           6 => 30,
           7 => 31,
           8 => 31,
           9 => 30,
           10 => 31,
           11 => 30,
           12 => 31 
                       }
i = 0

puts "Введите день: "
day = gets.chomp.to_i

puts "Введите месяц: "
month = gets.chomp.to_i

puts "Введите год: "
year = gets.chomp.to_i

if year % 4 == 0 && year % 100 != 0
  puts "#{ year } високосный год"
  months.store(2, 29)
end

months.each do |k, v|
  for i in 1..month
    if k == 1 
      puts "Порядковый номер даты #{ day }.#{ month }.#{ year } - #{  v - day  }"
    else
      v += v
      puts "Порядковый номер даты #{ day }.#{ month }.#{ year } - #{  v - day  }"
    end
  end  
end
