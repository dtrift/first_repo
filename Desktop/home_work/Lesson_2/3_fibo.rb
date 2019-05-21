fibo = [0, 1]

while fibo[-1] < 100 do
  fibo << fibo[-1] + fibo[-2]
end
puts "Числа Фибоначи до 100 #{fibo}"

