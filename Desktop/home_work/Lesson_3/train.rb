class Train
  attr_accessor :train, :number_wagons, :speed
  
  attr_reader :number, :type
  
  def initialize(number, type, number_wagons)
    @train = { number => [type, number_wagons] }
    @number = number
    @type = type
    @number_wagons = number_wagons
    @speed = 0
  end
  
  def speed_up
    self.speed = 100
  end
  
  def stop
    self.speed = 0
  end
  
  def add_wagon
    self.number_wagons += 1 if @speed == 0 
  end
  
  def delete_wagon
    self.number_wagons -= 1 if @speed == 0 
  end
  
  def get_route(route)
    @route = route
  end
  
  def train_move_route(route)

  end
  
end