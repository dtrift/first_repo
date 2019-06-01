class Train
  attr_reader :number, :type, :speed, :amount_wagons, :train_route 
                                                                   
  def initialize(number, type, amount_wagons = 1)T
    @number = number
    @type = type
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
    
  def go_route(train)
    if @train_route.any? 
      station(@train_route[0]).get_trains << train 
    end
  end
  
end
