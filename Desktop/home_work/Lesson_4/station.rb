class Station
  attr_reader :trains, :cargo, :passenger

  def initialize
    @trains = []
    @cargo = 0
    @passenger = 0
  end
  
  def get_train(train)
    @trains << train
    get_type  
  end

  def send_train(train)
    @trains.delete(train)
    delete_type
  end

  private 

  def get_type
    if train.type == :cargo
      @cargo += 1
    else @passenger += 1
    return @cargo, @passenger
    end
  end

  def delete_type
    if train.type == :cargo
      @cargo -= 1
    else @passenger -= 1
    return @cargo, @passenger
    end
  end

end
