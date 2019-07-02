module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_writer :sum
    @sum ||=0
    def instances
      @sum
    end
  end

  module InstanceMethods
    #@sum ||= 0  
    protected
    def register_instance
      @sum += 1    
    end
  end

end
