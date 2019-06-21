class WagonPassenger < Wagon

  def initialize(type)
    super
    @type = type
  end

  def type
    :passenger
  end

end
