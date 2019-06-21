class Wagon
  attr_reader :current_train

  def current_train
    @trains.each do |train| 
      if train.all_wagons.include?(self)
       return @current_train = train
      end
    end
  end

end
