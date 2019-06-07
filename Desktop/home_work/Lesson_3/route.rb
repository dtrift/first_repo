class Route  
  attr_reader :first_station, :last_station, :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
  end

  def add_station(station)
    @stations.insert(-2, station)
  end
  
  def delete_station(station)
    @stations.delete(station)
  end

end

  # route1 = Route.new station1, station4
  # route1.add_station station2
  # route1.add_station station3
