module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.validations = []
  end

  module ClassMethods 
    attr_accessor :validations

    def validate(attr_name, validation_type, params = nil)
      @validations ||= []
      @validations << { attr_name: attr_name, validation_type: validation_type, params: params }
    end

  end

  module InstanceMethods
  
    def validate!
      self.class.validations.each do |validation|
        var_name = instance_variable_get("@#{validation[:attr_name]}")
        method_name = validation[:validation_type]
        send(method_name, var_name, *validation[:params])
      end    
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def presence(attr_name)
      raise 'Name can not be nil!' if attr_name.empty? || attr_name.nil?
    end

    def format(validation_type, params)
      raise 'Wrong format!' if validation_type !~ params
    end

    def type(attr_name, params)
      raise 'Wrong type!' if validation_type.class != params
    end
  end
end
