module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods 

    def validate(attr_name, validation_type, *params = nil)
      @validations ||= []
      @validations << { validation => { attr_name: attr_name, params: params } }
    end

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

  # validate :name, :presence
  # validate :name, :format, /A-Z/
  # validate :name, :type, String

  module InstanceMethods

    def validate!
      #
      # Перебрать массив хешей @validations  
      # Получить значение первого элемента вложенного массива и 
      # сравнить его с условием второго элемента вложенного массива и
      # 
      # 1. Получить значение валидируемой переменной - instance_variable_get
      # 2. Cобрать название вызываемого метода валидации (например, validate_format)
      # 3. Cделать send на вызываемый метод
      #
      @validations.each do |attr_name, validation_type|
        
      end
     
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end
  end

end
