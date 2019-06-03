class Station
  attr_reader :name, :trains, :list_types

  def initialize(name)
    @name = name
    @trains = []
    @list_types = []
    
  end
  
  def get_train(train)
    @trains << train 
    @list_types << train.type
  end

  def send_train(train)
    @trains.delete(train)
    @list_types.delete(train.type)
  end
  
  def get_list_types
    cargo = 0
    passenger = 0
    @list_types.each do |type|
      if type == "cargo"
        cargo += 1
      else passenger += 1
      return cargo, passenger
      end
    end
  end

end
