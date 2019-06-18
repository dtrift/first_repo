class Route  
  attr_reader :first_station, :last_station, :all_stations, :name

  def initialize(name, first_station, last_station)
    @name = name
    @all_stations = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
  end

  def add_station(station)
    @all_stations.insert(-2, station)
  end
  
  def delete_station(station)
    @all_stations.delete(station)
  end

end
