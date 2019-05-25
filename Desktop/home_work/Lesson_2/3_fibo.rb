fibo = [0, 1]

while  (new_number = fibo[-1] + fibo[-2]) < 100 do
  fibo << new_number
end
puts "Числа Фибоначи до 100 #{fibo}"
