module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end
  #@sum = 0
  module ClassMethods
    def instances
      @sum
    end
  end

  module InstanceMethods
    #@sum = 0
    protected
    def register_instance
      @sum += 1    
    end
  end

end
