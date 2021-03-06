class Train
  attr_accessor :speed

  attr_reader :number, :type, :amount_wagons, :train_route, :current_station_index 
                                                                   
  def initialize(number, type = :type, amount_wagons = 1)
    @number = number
    @type = type
    @amount_wagons = amount_wagons
    @speed = 0
    @train_route = nil
    @current_station_index = nil
  end
  
  def add_wagon
    @amount_wagons += 1 if @speed == 0 
  end
  
  def delete_wagon
    if @amount_wagons >= 2 && @speed == 0
      @amount_wagons -= 1  
    end
  end
  
  def get_route(route)
    @current_station_index = 0
    @train_route = route
    @train_route.first_station.get_train(self)
  end

  def current_station
    @train_route.stations[@current_station_index]
  end

  def next_station
    @train_route.stations[@current_station_index + 1] if @current_station_index + 1 < @train_route.stations.length 
  end

  def previous_station
    @train_route.stations[@current_station_index - 1] if @current_station_index > 0
  end
  
  def move_forward
    if @current_station_index + 1 < @train_route.stations.length   
      @current_station_index += 1
      @train_route.stations[@current_station_index - 1].send_train(self)
      @train_route.stations[@current_station_index].get_train(self)
    end
    return previous_station, current_station, next_station
  end
  
  def move_back
    if @current_station_index > 0
      @current_station_index -= 1
      @train_route.stations[@current_station_index + 1].send_train(self)
      @train_route.stations[@current_station_index].get_train(self)
    end
    return previous_station, current_station, next_station
  end

end
