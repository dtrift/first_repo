class WagonCargo < Wagon
  
  def initialize(type)
    super
    @type = type
  end

  def type
    :cargo
  end
  
end
