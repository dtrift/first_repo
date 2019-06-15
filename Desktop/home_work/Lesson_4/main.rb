require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passenger.rb'
require_relative 'wagon.rb'
require_relative 'wagon_cargo.rb'
require_relative 'wagon_passenger.rb'
require_relative 'route.rb'
require_relative 'station.rb'

class RailRoad
  menu_item = nil
  loop do 
    puts
    puts "Добро пожаловать в программу управления железной дорогой"
    puts
    puts "Выбери номер пункта меню"
    puts
    puts "Mеню:"
    puts
    puts "1. Создать поезд"
    puts "2. Создать станцию"
    puts "3. Создать и редактировать маршрут"
    puts "4. Назначить маршрут поезду"
    puts "5. Добавить/оцепить вагон"
    puts "6. Отправить поезд по маршруту"
    puts "7. Показать список станций и список поездов на станции"
    puts "8. Выход"
    menu_item = gets.chomp.to_i
    break if menu_item.(1..8)
  end

end
