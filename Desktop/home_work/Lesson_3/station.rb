class Station
  attr_reader :station
  
  def initialize(station)
    @station = {}
  end
  
  def add_train(train)
    @station.store(station, train)
  end
  
  def show_trains(train)
    @station.each { |train, number| puts " Список поездов на станции #{station}: #{train[number]} " }
  end
  
  def show_types_trains(train)
    @station.each { |train, type| puts " Список поездов по типу на станции #{station}: #{train[type]} " }
  end
  
  def send_train(train)
    @station.delete(train)
  end
  
end

