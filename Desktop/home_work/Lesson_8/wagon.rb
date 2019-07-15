class Wagon
  include InstanceCounter
  include Factory

  attr_reader :current_train

  def initialize(*args)
    @current_train = nil
    validate!
    register_instance
  end

  def number
    self.class.instances
  end

  def valid?
    validate!
    true 
  rescue
    false
  end

  def get_current_train(train)
    @current_train = train.number
  end

  def del_current_train
    @current_train = nil
  end

end
