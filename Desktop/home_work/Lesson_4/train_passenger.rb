class TrainPassenger < Train

  def initialize(number, type)
    super
    @type = type
  end

  def type
    :passenger
  end

end
