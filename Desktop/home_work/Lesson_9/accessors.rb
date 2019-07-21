module Accessors

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @var_name_history_values = []
    @method_name = nil

    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        @method_name = "#{name}"
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          @var_name_history_values << value
        end
      end
    end

    def strong_attr_accessor(attr, attr_class)
      
    end

  module InstanceMethods 

    def "#{@method_name}_history"
      @var_name_history_values 
    end

  end

end
