class Train
  attr_reader :number, :type, :speed, :amount_wagons, :train_route # type == cargo = 1 || passenger = 0
                                                                   # использовать type как булевую переменную? || .to_s
  def initialize(number, type, amount_wagons = 1)
    @number = number.to_s
    @type = type.to_s
    @amount_wagons = amount_wagons.to_i
    @speed = 0
    @train_route = []
    @error = "Ошибка! Количество вагонов должно быть > 1 !"
  end
  
  def add_wagon
    @amount_wagons += 1 if @speed == 0 
  end
  
  def delete_wagon
    if @amount_wagons > 2 && @speed == 0
      @amount_wagons -= 1  
    else return @error
    end
  end
  
  def add_route(route)
    @train_route = route.stations
    @train_route.each { |station| return station }
  end
    
  def send(number)
    if @train_route.any?
      station.trains << number
    end
  end
  
end
