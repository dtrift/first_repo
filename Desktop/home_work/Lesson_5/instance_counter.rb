module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def instances
      @instances ||= 0
    end

    def increase_instance_counter
      @instances += 1
    end

  end

  module InstanceMethods
    protected
    def register_instance
      self.class.increase_instance_counter   
    end
  end

end
