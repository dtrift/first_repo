class Train
  attr_accessor :speed

  attr_reader :number, :type, :amount_wagons, :train_route, :current_station_index 
                                                                   
  def initialize(number, type, amount_wagons = 1)
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
  
  def move_forward
    @current_station_index += 1
    @train_route.stations.each_index do |index|
      if @current_station_index == index 
        @train_route.stations[index-1].send_train(self)
        @train_route.stations[index].get_train(self)
        previous_station = @train_route.stations[index-1]
        current_station = @train_route.stations[index]
        next_station = @train_route.stations[index+1] 
        return previous_station.name, current_station.name, next_station.name 
      end
    end
  end
  
  def move_back
    @current_station_index -= 1
    @train_route.stations.each_index do |index|
      if @current_station_index == index 
        @train_route.stations[index+1].send_train(self)
        @train_route.stations[index].get_train(self)
        previous_station = @train_route.stations[index+1]
        current_station = @train_route.stations[index]
        next_station = @train_route.stations[index-1]
        return previous_station.name, current_station.name, next_station.name 
      end
    end 
  end

end

  # train1 = Train.new 1, 'cargo', 10
  # train1.get_route route1
  # train1.move_forward
  # train1.move_forward
  # train1.move_back
