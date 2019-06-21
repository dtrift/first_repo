class TrainCargo < Train

  def initialize(number, type)
    super
    @type = type
  end

  def type
    :cargo 
  end

end
