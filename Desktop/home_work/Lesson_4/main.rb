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
  puts "    ------   }    "
  puts "    |    |  ||    "
  puts "    |----|------} "
  puts "    -O-O---O-O--} " 
  puts " =============================="
  puts
  puts "Добро пожаловать в программу управления железной дорогой"
  puts
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
    print "Выбери номер пункта меню: "
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
    else "Выбери номер пункта меню!"
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
  loop do
    puts
    puts "1. Грузовой"
    puts "2. Пассажирский"
    print "Выбери тип поезда: "
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
  @item_route = nil
  name = nil
  first_station = nil
  last_station = nil
  loop do 
    puts
    puts "1. Создать маршрут"
    puts "2. Редактировать маршрут"
    puts "3. Вернуться в главное меню"
    print "Выбери пункт меню: "
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
  list_stations
  print "Выбери номер начальной станции: "
  first_station = gets.chomp.to_i
  first_station = @stations[first_station-1]
  puts "Начальная станция #{first_station.name}"
  puts
  list_stations
  print "Выбери номер конечной станции: "
  last_station = gets.chomp.to_i
  last_station = @stations[last_station-1]
  puts "Конечная станция #{last_station.name}"
  @routes << (Route.new name, first_station, last_station)
  puts "Создан маршрут #{name} - начальная станция #{first_station.name}, конечная станция #{last_station.name}"
end

def edit_route
  puts "Список маршрутов для редактирования:"
  list_routes
  print "Выбери номер маршрута для редактирования: "
  @item_route = gets.chomp.to_i
  @route = @routes[@item_route-1]
  loop do
    puts " "
    puts "1. Добавить станцию в маршрут #{@route.name}"
    puts "2. Удалить станцию из маршрута #{@route.name}"
    puts "3. Вернуться в предыдущее меню"
    puts "4. Вернуться в главное меню"
    print "Выбери номер пункта меню: "
    menu_item = gets.chomp.to_i
    case menu_item
    when 1 
      route_add_station
    when 2
      route_delete_station
    when 3
      manage_route
    when 4
      main_menu
    else puts "Выбери 1, 2, 3 или 4"
    end
  end
end

def route_add_station
  puts @route.name  
  puts "Список станций для добавления в маршрут:"
  list_stations
  print "Введи номер станции для добавления в маршрут: "
  station = gets.chomp.to_i
  station = @stations[station-1]
  puts station.name
  @route.add_station(station)
  puts "Список станций на маршруте #{@route.name}" 
  puts "#{@route.all_stations}"
end

def route_delete_station
  puts @route.name
  list_route_stations  
  print "Введи номер станции для удаления из маршрута: "
  station = gets.chomp.to_i
  station = @stations[station-1]
  puts station.name
  @route.delete_station(station)
  puts "Список станций на маршруте #{@route.name}" 
  puts "#{@route.all_stations}"
end

def list_stations
  @stations.each.with_index do |station, index|
    puts "#{index+1}. #{@stations[index]} - #{@stations[index].name}"
  end
end

def list_routes
  @routes.each.with_index do |route, index|
    puts "#{index+1}. #{@routes[index].name}"
  end
end
  
def list_route_stations
  @route.all_stations.each.with_index do |station, index|
    puts "#{index+1}. #{@route.all_stations[index]} - #{@route.all_stations[index].name}"
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
  @trains << (train1 = Train.new 1, :cargo)
  @trains << (train2 = Train.new 2, :passenger)
  @trains << (train3 = Train.new 3, :cargo)
  @trains << (train4 = Train.new 4, :passenger)
  @stations << (one = Station.new 'one')
  @stations << (two = Station.new 'two')
  @stations << (three = Station.new 'three')
  @stations << (four = Station.new 'four')
  @stations << (five = Station.new 'five')
  @stations << (six = Station.new 'six')
  @routes << (one = Route.new 'one-six', one, six)
  @routes << (two = Route.new 'two-five', two, five)
  @routes << (three = Route.new 'one-four', one, four)
  @routes << (four = Route.new 'three-six', three, six)
end

seed
welcome
main_menu
