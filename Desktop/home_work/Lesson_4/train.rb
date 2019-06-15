class Train
  attr_accessor :speed

  attr_reader :number, :type, :wagons, :train_route
                                                                   
  def initialize(number, type = :type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    @train_route = nil
    @current_station_index = nil
  end
  
  def add_wagon(wagon)
    @wagons << wagon if @speed == 0 && train.type == wagon.type
  end
  
  def delete_wagon(wagon)
    @wagons.delete(wagon) if @speed == 0
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
    @train_route.stations[@current_station_index + 1] if next? 
  end

  def previous_station
    @train_route.stations[@current_station_index - 1] if previous?
  end
  
  def move_forward
    if next?   
      @current_station_index += 1
      @train_route.stations[@current_station_index - 1].send_train(self)
      @train_route.stations[@current_station_index].get_train(self)
    end
    return  current_station
  end
  
  def move_back
    if previous?
      @current_station_index -= 1
      @train_route.stations[@current_station_index + 1].send_train(self)
      @train_route.stations[@current_station_index].get_train(self)
    end
    return current_station
  end

  private 
  attr_reader :current_station_index # переменная используется только внутри класса для
                                     # определения текущей, предыдущей и следующей станции
  def next?
    @current_station_index + 1 < @train_route.stations.length
  end

  def previous?
    @current_station_index > 0
  end
  
end
