class WagonCargo < Wagon
  #include InstanceCounter

  attr_reader :volume, :busy_volume

  def initialize(volume = 1000)
    @volume = volume.to_i
    @busy_volume = 0
    super
    #validate!
    #register_instance
    #@number = self.class.instances
  end

  #def valid?
  #  validate!
  #  true 
  #rescue
  #  false
  #end

  def type
    :cargo
  end

  def add_busy_volume(add_busy_volume)
    @busy_volume += add_busy_volume if @busy_volume + add_busy_volume <= @volume
  end

  def free_volume
    @volume - @busy_volume
  end 

  protected 

  def validate!
    raise "Объем грузового вагона не может превышать 1000" if volume > 1000 
  end
  
end
