class Route
  attr_reader :first_station, :last_station

  attr_accessor :intermediate_station, :route
  
  def initialize(first_station, last_station)
    @route = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
    @intermediate_station = intermediate_station
    @trains = []
  end
  
  def show_intermediate_station
    @route[1..-2].each { |stations| puts stations }
  end

  def add_station(intermediate_station)
    @route.insert(-2, intermediate_station)
  end
  
  def delete_station(intermediate_station)
    @route.delete(intermediate_station)
  end
  
  def show_route
    @route.each { |stations| puts stations }   
  end

  def send_route(train)
    @trains << train
    train.get_route(self)
  end
  
end