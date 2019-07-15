# frozen_string_literal: true

class Wagon
  include InstanceCounter
  include Factory

  attr_reader :number, :current_train

  def initialize(*_args)
    @current_train = nil
    validate!
    register_instance
    @number = self.class.instances
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def get_current_train(train)
    @current_train = train.number
  end

  def del_current_train
    @current_train = nil
  end
end
