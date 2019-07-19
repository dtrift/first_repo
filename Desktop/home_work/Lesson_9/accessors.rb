module Accessors

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        var_name_history = "#{name}"
        var_name_history_values = []
        define_method(name) { instance_variable_get(var_name) }
        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          var_name_history_values << value
        end
      end
    end

    def strong_attr_accessor(имя_атрибута, класс_атрибута)
      
    end

  module InstanceMethods 

    def "#{var_name_history}_history"
      var_name_history_values
    end

  end
end
