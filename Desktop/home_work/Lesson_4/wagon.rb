class Wagon
  attr_reader :current_train

  def initialize
    @current_train = nil
  end

  def current_train
    @trains.each do |train| 
      if train.all_wagons.include?(self)
        @current_train = train
      end
    end
  end

end
