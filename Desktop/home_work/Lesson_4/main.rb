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
  puts "    ------   }                  "
  puts "    |    |  ||                  "
  puts "    |----|------}               "
  puts "    -O-O---O-O--}               " 
  puts " ============================== "
  puts
  puts "Добро пожаловать в программу управления железной дорогой"
  puts
end

def main_menu
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
    else puts "Выбери номер пункта меню!"
    end  
  end
end
  
def create_train
  puts
  puts "Создание поезда"
  puts "********************"
  print "Введи название поезда: "
  number = gets.chomp
  select_type
  puts "***************************"
  if @type == :cargo
    @trains << (TrainCargo.new number)  
    puts "Создан поезд - #{number}, тип - грузовой"
  else 
    @trains << (TrainPassenger.new number)
    puts "Создан поезд - #{number}, тип - пассажирсикй"
  end
end

def select_type
  @type = nil
  loop do
    puts "Типы:"
    puts "1. Грузовой"
    puts "2. Пассажирский"
    print "Выбери тип поезда: "
    @type = gets.chomp.to_i  
    case @type 
    when 1
      @type = :cargo
    when 2
      @type = :passenger
    else puts "Неверно задан тип. Выбери 1 или 2"
    end
  break if @type == :cargo || @type == :passenger
  end
end
          
def create_station
  name = nil 
  puts
  puts "Создание станции"
  puts "********************"
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
    puts "Управление маршрутами"
    puts "********************"
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
  puts
  puts "Создание маршрута"
  puts "********************"
  print "Введи название маршрута: "
  name = gets.chomp
  puts "Список станций:"
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
  puts
  puts "Редактирование маршрута"
  puts "********************" 
  puts "Список маршрутов для редактирования:"
  list_routes
  print "Выбери номер маршрута для редактирования: "
  @item_route = gets.chomp.to_i
  @route = @routes[@item_route-1]
  loop do
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
  puts
  puts "Добавление станции в маршрут #{@route.name}"
  puts "********************" 
  puts "Список станций для добавления в маршрут:"
  list_stations
  print "Введи номер станции для добавления в маршрут: "
  station = gets.chomp.to_i
  station = @stations[station-1]
  @route.add_station(station)
  puts "Список станций на маршруте #{@route.name}" 
  puts "#{@route.all_stations}"
end

def route_delete_station
  puts
  puts "Удаление станции из маршрута #{@route.name}"
  puts "********************"
  list_route_stations  
  print "Введи номер станции для удаления из маршрута: "
  station = gets.chomp.to_i
  station = @route.all_stations[station-1]
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
    puts "#{index+1}. #{@routes[index].name} - #{@routes[index].all_stations}"
  end
end
  
def list_route_stations
  @route.all_stations.each.with_index do |station, index|
    puts "#{index+1}. #{@route.all_stations[index]} - #{@route.all_stations[index].name}"
  end
end
  
def list_trains
  @trains.each.with_index do |train, index|
    puts "#{index+1}. Поезд #{@trains[index].number} - тип #{@trains[index].type}"
  end
end

def assign_route
  train = nil
  puts
  puts "Добавление маршрута поезду"
  puts "********************"
  puts "Список поездов: "
  list_trains
  print "Выбери поезд для добавления маршрута: "
  train = gets.chomp.to_i
  @train = @trains[train-1]
  puts "Список маршрутов: "
  list_routes
  print "Выбери номер маршрута для добавления поезду #{@train.number}: "
  @item_route = gets.chomp.to_i
  @route = @routes[@item_route-1]
  if @train.train_route.nil?
    @train.get_route(@route)
    puts "Поезду #{@train.number} добавлен маршрут #{@route.name}"
  else puts "Ошибка! У поезда #{@train.number} уже есть маршрут #{@train.train_route}!"
  end
end

def manage_wagon
  wagon_item = nil
  loop do
    puts
    puts "Управление вагонами"
    puts "********************"
    puts "1. Создать вагон"
    puts "2. Прицепить вагон"
    puts "3. Отцепить вагон"
    puts "4. Вернуться в главное меню"
    print "Выбери номер меню: "
    wagon_item = gets.chomp.to_i
    case wagon_item
    when 1 
      create_wagon
    when 2
      hook_wagon
    when 3
      unhook_wagon
    when 4
      main_menu
    else puts "Выбери 1, 2, 3 или 4"
    end
  end
end
    
def create_wagon
  puts
  puts "Создание вагона"
  puts "********************"
  select_type
  if @type == :cargo
    @wagons << (WagonCargo.new)
  else @wagons << (WagonPassenger.new)
  end
  puts "Создан вагон #{@type}"
end
    
def hook_wagon
  puts
  puts "Прицепление вагона к поезду"
  puts "********************"
  puts "Список вагонов:"
  list_wagons
  print "Выбери вагон: "
  wagon = gets.chomp.to_i
  wagon = @wagons[wagon-1]
  puts "Выбран вагон #{wagon}"
  list_trains
  print "Выбери поезд к которому прицепить вагон: "
  train = gets.chomp.to_i
  train = @trains[train-1]
  if wagon.current_train == nil
    if train.type == wagon.type
      train.add_wagon(wagon)
      wagon.get_current_train(train)
      puts "Вагон #{wagon} прицеплен к поезду #{train}"
      puts train.all_wagons
    else puts "Ошибка! Поезд #{train.type} и вагон #{wagon.type} несовместимы!"
    end
  else puts "Ошибка! Вагон уже прицеплен к поезду #{wagon.current_train}"
  end
end

def unhook_wagon
  puts
  puts "Отцепление вагона от поезда"
  puts "********************"
  puts "Список вагонов:"
  list_wagons
  print "Выбери вагон: "
  wagon = gets.chomp.to_i
  wagon = @wagons[wagon-1]
  puts "Выбран вагон #{wagon}"
  @trains.each do |train|
    if train.all_wagons.include?(wagon)
      wagon.del_current_train
      train.delete_wagon(wagon)
    puts "Вагон #{wagon} отцеплен от поезда #{train}"
    end
  end
end

def send_train
  puts "Движение поезда по маршруту"
  puts "********************"
  list_trains
  print "Выбери поезд для движения по маршруту: "
  train = gets.chomp.to_i
  train = @trains[train-1]
  puts "Маршрут поезда #{train} - #{train.train_route}"
  puts "Текущая станция #{train.current_station.name}"
  loop do
    puts "Следующее действие:"
    puts "1. Двигать поезд вперёд"
    puts "2. Двигать поезд назад"
    puts "0. Выход"
    print "Выбери следующее действие: "
    move_item = gets.chomp.to_i
    case move_item
    when 1 
      train.move_forward
      puts "Предыдущая станция - #{train.previous_station.name}" if train.previous_station != nil
      puts "Текущая станция - #{train.current_station.name}"
      puts "Следующая станция - #{train.next_station.name}" if train.next_station != nil
    when 2
      train.move_back 
      puts "Предыдущая станция - #{train.previous_station.name}" if train.previous_station != nil
      puts "Текущая станция - #{train.current_station.name}"
      puts "Следующая станция - #{train.next_station.name}" if train.next_station != nil
    when 0 
      main_menu
    else "Выбери 1, 2 или 0"
    end
  end
end

def list_wagons
  @wagons.each.with_index do |wagon, index|
    puts "#{index+1}. Вагон #{@wagons[index].type} => поезд: #{@wagons[index].current_train}"  
  end
end
          
def list_stations_trains
  puts
  puts "Список станций"
  puts "********************"
  list_stations
  print "Введи номер станци для просмотра: "
  st = gets.chomp.to_i
  st = @stations[st-1] 
  print "На станции #{st.name} находятся поезда: " 
  st.all_trains.each { |at| print at, " " }
  puts 
end

def seed
  @trains << (train1 = TrainCargo.new 1)
  @trains << (train2 = TrainPassenger.new 2)
  @trains << (train3 = TrainCargo.new 3)
  @trains << (train4 = TrainPassenger.new 4)
  @stations << (one = Station.new 'one')
  @stations << (two = Station.new 'two')
  @stations << (three = Station.new 'three')
  @stations << (four = Station.new 'four')
  @stations << (five = Station.new 'five')
  @stations << (six = Station.new 'six')
  @routes << (one = Route.new 'one-six', one, six)
  @routes << (two = Route.new 'two-five', two, five)
end

seed
welcome
main_menu
