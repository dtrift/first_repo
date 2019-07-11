class Train
  include Factory
  include InstanceCounter

  attr_accessor :speed

  attr_reader :number, :all_wagons, :train_route, :current_station_index
  NUMBER_FORMAT = /^\w\w\w-*\w\w$/

  @@all = {}

  def self.find(number)
    @@all[number] 
  end

  def self.all
    @@all 
  end
                                                                   
  def initialize(number)
    @number = number
    @all_wagons = []
    @speed = 0
    @train_route = nil
    @current_station_index = nil
    validate!
    @@all.store(number, self)
    register_instance
  end

  def valid?
    validate!
    true 
  rescue
    false
  end

  def show_all_wagons(&block)
    @all_wagons.each { |wagon| yield(wagon) }
  end

  def add_wagon(wagon)
    @all_wagons << wagon if @speed == 0 
  end
  
  def delete_wagon(wagon)
    @all_wagons.delete(wagon) if @speed == 0
  end
  
  def get_route(route)
    @current_station_index = 0
    @train_route = route
    @train_route.first_station.get_train(self)
  end

  def current_station
    @train_route.all_stations[@current_station_index]
  end

  def next_station
    @train_route.all_stations[@current_station_index + 1] if next? 
  end

  def previous_station
    @train_route.all_stations[@current_station_index - 1] if previous?
  end
  
  def move_forward
    if next?   
      @current_station_index += 1
      @train_route.all_stations[@current_station_index - 1].send_train(self)
      @train_route.all_stations[@current_station_index].get_train(self)
    end
    return  current_station
  end
  
  def move_back
    if previous?
      @current_station_index -= 1
      @train_route.all_stations[@current_station_index + 1].send_train(self)
      @train_route.all_stations[@current_station_index].get_train(self)
    end
    return current_station
  end

  def next?
    @current_station_index + 1 < @train_route.all_stations.length
  end

  def previous?
    @current_station_index > 0
  end

  protected
  
  def validate!
    raise "Номер поезда не может быть пустым!" if number.nil? 
    raise "Длина номера поезда не может быть меньше 5 символов" if number.length < 5
    raise "Длина номера поезда не может быть больше 6 символов" if number.length > 6
    raise "Номер поезда не соответсвует формату: Q5z-Rs, 6Y5-d9, Jkw7G " if number !~ NUMBER_FORMAT
  end
  
end
