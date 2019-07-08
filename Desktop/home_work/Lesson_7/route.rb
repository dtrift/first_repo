class Route  
  include InstanceCounter

  attr_reader :first_station, :last_station, :all_stations, :name

  def initialize(name, first_station, last_station)
    @name = name
    @all_stations = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
    @sum = 0
    validate!
    register_instance
  end

  def valid?
    validate!
    true 
  rescue
    false
  end

  def add_station(station)
    @all_stations.insert(-2, station)
  end
  
  def delete_station(station)
    @all_stations.delete(station)
  end

  protected
  
  def validate!
    raise "Название маршрута не может быть пустым!" if name.nil? 
  end

end
