class Wagon
  include Factory

  attr_reader :number, :current_train

  def initialize
    @current_train = nil
  end

  def get_current_train(train)
    @current_train = train.number
  end

  def del_current_train
    @current_train = nil
  end

end
