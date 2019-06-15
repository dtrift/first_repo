class Wagon
  attr_reader :type

  def initialize(type = :type)
    @type = type
  end

  def current_train 
    train if train.wagons.include?(self)
  end

end
