class Station
  attr_reader :name, :trains, :cargo, :passenger

  def initialize(name)
    @name = name
    @trains = []
    @cargo = 0
    @passenger = 0
  end
  
  def get_train(train)
    @trains << train
    if train.type == :cargo
      @cargo += 1
    else @passenger += 1
    return @cargo, @passenger
    end
  end

  def send_train(train)
    @trains.delete(train)
    if train.type == :cargo
      @cargo -= 1
    else @passenger -= 1
    return @cargo, @passenger
    end
  end

end
