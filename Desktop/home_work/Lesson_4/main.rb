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
  puts " ------   }    "
  puts " |    |  ||    "
  puts " |----|------} "
  puts " -O-O---O-O--} " 
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
      assign_route
    when 5
      manage_wagon
    when 6
      send_train
    when 7
      list_stations_trains
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
  @trains << (Train.new number, type)
  puts "Создан поезд #{number}, тип: #{type}"
end
          
def create_station
  name = nil
  puts 
  puts "Создание станции"
  print "Введи название станции: "
  name = gets.chomp
  @stations << (Station.new name)
  puts "Создана станция #{name}"
end
        
def manage_route
  menu_item = nil
  route = []
  name = nil
  first_station = nil
  last_station = nil
  loop do 
    puts
    puts "1. Создать маршрут"
    puts "2. Редактировать маршрут"
    puts "3. Вернуться в предыдущее меню"
    menu_item = gets.chomp.to_i
    case menu_item
    when 1
      create_route
    when 2
      edit_route
    when 3  
      main_menu
    else puts "Выбери 1, 2 или 3"
    end
  end
end

def create_route
  print "Введи название маршрута: "
  name = gets.chomp
  puts "Выбери начальную станцию"
  list_stations
  first_station = gets.chomp.to_i
  first_station = @stations[first_station-1]
  puts "Начальная станция #{first_station.name}"
  puts
  puts "Выбери конечную станцию"
  list_stations
  last_station = gets.chomp.to_i
  last_station = @stations[last_station-1]
  puts "Конечная станция #{last_station.name}"
  @routes << (Route.new name, first_station, last_station)
  puts "Создан маршрут #{name} - начальная станция #{first_station.name}, конечная станция #{last_station.name}"
end

def list_stations
  @stations.each.with_index do |station, index|
    puts "#{index+1}. #{@stations[index]} - #{@stations[index].name}"
  end
end

def edit_route
  puts "Выбери маршрут для редактирования"
  list_routes
  route = gets.chomp.to_i
  route = @routes[route-1]
end

def list_routes
  @routes.each.with_index do |route, index|
    puts "#{index+1}. #{@routes[index]} - #{@routes[index]}"
  end
end

def assign_route
end

def manage_wagon
end

def send_train
end
          
def list_stations_trains
end

def seed 
  @stations << (one = Station.new 'one')
  @stations << (two = Station.new 'two')
  @stations << (three = Station.new 'three')
  @stations << (four = Station.new 'four')
  @stations << (five = Station.new 'five')
  @stations << (six = Station.new 'six')
end


#welcome
#main_menu
