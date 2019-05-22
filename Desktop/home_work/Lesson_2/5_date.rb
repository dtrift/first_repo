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
months_leap = months 
number = 0

puts "Введите день: "
day = gets.chomp.to_i

puts "Введите месяц: "
month = gets.chomp.to_i

puts "Введите год: "
year = gets.chomp.to_i

t = Time.new(year, month, day)
puts t

if year % 4 == 0 && year % 100 != 0
  puts "#{ year } високосный год"
  months_leap.store(2, 29)
  puts months_leap
  months_leap.each do |m, d| 
    if month == months_leap[d]
    number += months_leap[d]
    puts "Порядковый номер даты #{ number }"
    end
  end
else number += months[d]
puts "Порядковый номер даты #{ number }"  
end
