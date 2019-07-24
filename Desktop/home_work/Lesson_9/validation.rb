module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods 

    def validate(attr_name, validation, other = nil)
      @validations ||= []
      @validations << [attr_name, validation, other]
    # @validations << {} - или лучше использовать массив хэшей?
    end

    def presence(attr_name)
      raise 'Name can not be nil!' if attr_name.empty? || attr_name.nil?
    end

    def format(validation, other)
      raise 'Wrong format!' if validation !~ other
    end

    def type(attr_name, other)
      raise 'Wrong type!' if validation.class != other
    end

  end

  module InstanceMethods

    def validate!
      # Перебрать массив массивов @validations  
      # Получить значение первого элемента вложенного массива и 
      # сравнить его с условием второго элемента вложенного массива и
      # 
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end

end
