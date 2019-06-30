module Factory

  def set_factory_name(name)
    self.factory_name = name
  end

  def factory_name
    self.factory_name
  end

  protected

  attr_accessor :factory_name

end

module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@instances = 0
    def instatnces
      @@instances
    end
  end

  protected
  module InstanceMethods
    def register_instance
      @@instances += 1    
    end
  end

end
