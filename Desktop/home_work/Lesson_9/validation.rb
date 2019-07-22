module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods 

    def validate(*attr_name, *validation_type)
      # ####
    end

  end

  module InstanceMethods
  end

end
