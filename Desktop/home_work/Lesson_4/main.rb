require_relative 'train.rb'
require_relative 'train_cargo.rb'
require_relative 'train_passenger.rb'
require_relative 'wagon.rb'
require_relative 'wagon_cargo.rb'
require_relative 'wagon_passenger.rb'
require_relative 'route.rb'
require_relative 'station.rb'

@trains = []
@stations = []
@routes = []
@wagons = []

def welcome
  puts
  puts " ------    }    "
  puts " |    |   ||    "
  puts " |----|-------} "
  puts " -O-O----O-O--} " 
  puts
  puts "Добро пожаловать в программу управления железной дорогой"
  puts
  puts "Выбери номер пункта меню"
end

def main_menu
  menu_item = nil
  loop do 
    puts
    puts "Mеню:"
    puts "1. Создать поезд"
    puts "2. Создать станцию"
    puts "3. Создать и редактировать маршрут"
    puts "4. Назначить маршрут поезду"
    puts "5. Добавить/оцепить вагон"
    puts "6. Отправить поезд по маршруту"
    puts "7. Показать список станций и список поездов на станции"
    puts "0. Выход"
    menu_item = gets.chomp.to_i
    case menu_item
    when 1 
      create_train
    when 2 
      create_station
    when 3 
      manage_route
    when 4
      send_train
    when 5
      manage_wagon
    when 6
      list_stations_trains
    when 7

    when 0
      exit
    end  
  end
end
  
def create_train
  number = nil
  type = nil
  puts 
  puts "Создание поезда"
  print "Введи название поезда: "
  number = gets.chomp
  puts "Выбери тип поезда:"
  loop do
    puts "1. Грузовой"
    puts "2. Пассажирский"
    type = gets.chomp.to_i  
    case type 
    when 1
      type = :cargo
    when 2
      type = :passenger
    else puts "Неверно задан тип поезда. Выбери 1 или 2"
    end
  break if type == :cargo || type == :passenger
  end
  puts "***************************"
  puts "Название поезда: #{number}"
  puts "Тип поезда: #{type}"
  @trains << (number = Train.new number, type)
end
          
def create_station
  name = nil
  puts 
  puts "Создание станции"
  print "Введи название станции: "
  name = gets.chomp
  @stations << (name = Station.new name)
end
        
def manage_route
  route = []
  first_station = nil
  last_station = nil
  puts "Выбери начальную станцию"
  puts @stations
  #@routes << (Route.new first_station, last_station)
end

def send_train
end

def manage_wagon
end
          
def list_stations_trains
end

welcome
main_menu
