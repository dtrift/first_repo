class WagonPassenger < Wagon
  include InstanceCounter

  attr_reader  :seats, :busy_seats

  def initialize(seats = 25)
    @seats = seats.to_i
    @busy_seats = 0
    validate!
    register_instance
    @number = self.class.instances
  end

  def valid?
    validate!
    true 
  rescue
    false
  end

  def type
    :passenger
  end

  def add_busy_seats
    @busy_seats += 1 if @busy_seats < @seats
  end

  def free_seats
    @seats - @busy_seats
  end

  protected 
  
  def validate!
    raise "Количество мест в пассажирском вагоне не должно превышать 25" if seats > 25
  end

end
