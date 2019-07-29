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
        puts validation
      end    
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    def validate_presence(attr_name)
      raise 'Name can not be nil!' if attr_name.empty? || attr_name.nil?
    end

    def validate_format(validation_type, params)
      raise 'Wrong format!' if validation_type !~ params
    end

    def validate_type(attr_name, params)
      raise 'Wrong type!' if validation_type.class != params
    end
  end
end


        # # validation.each do |key, value|
        # #   var_name = "@#{key}".to_sym
        # #   define_method(key) { instance_variable_get(var_name) }
        # #   method_name = "validate_#{validation_type}".to_sym
        # #   send(method_name, instance_variable_get(var_name, value))
        # end
