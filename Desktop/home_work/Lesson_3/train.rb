class Train
  attr_accessor :speed

  attr_reader :number, :type, :amount_wagons, :train_route, :current_station 
                                                                   
  def initialize(number, type, amount_wagons = 1)
    @number = number
    @type = type
    @amount_wagons = amount_wagons
    @speed = 0
    @train_route = []
    @current_station = current_station
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
    @train_route = route
    route.first_station.get_train(self)
  end
    
  def move_forward

  end

  def move_back
  end
  
end
