class TrainCargo < Train
  attr_reader :type

  def initialize(type = :type)
    @type = type
  end

  def type
    :cargo 
  end

end
