class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end
  
  def get_train(number)
    @trains << train.number
  end

  def delete_train(number)
    @trains.delete(number)
  end

end
