module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods 

    def validate(attr_name, validation_type, params = nil)
      @validations ||= []
      @validations << { attr_name: attr_name, validation_type: validation_type params: params }
    end

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

  module InstanceMethods

    def validate!
      #
      # validate :name, :presence
      # validate :name, :format, /A-Z/
      # validate :name, :type, String - что тут происходит? =>
      # validate - вызываю метод validate
      # :name - передаю в метод в качестве параметра инстанс переменную в виде символа :name
      # (или другую переменную, которую необходимо отвалидировать, например: number)
      # :precence - метод, который принимает значение переменной :name и
      # осуществляет проверку на соотвествие заданным в методе параметрам
      # (может быть и другой метод, например :format или :type, которые принимают
      # в качестве аргумента дополнительный параметр из массива *params)
      #
      # Перебрать массив хешей @validations
      # Получить значение первого элемента вложенного массива и
      # сравнить его с условием второго элемента вложенного массива
      # 
      # 1. Получить значение валидируемой переменной - instance_variable_get
      # 2. Cобрать название вызываемого метода валидации (например, validate_format)
      # 3. Cделать send на вызываемый метод
      #
      @validations.each do |attr_name, validation_type, params|
        var_name = "@#{attr_name}".to_sym
        define_method(attr_name) { instance_variable_get(var_name) }
        method_name = "validate_#{validation_type}".to_sym
        send(method_name, instance_variable_get (var_name, params)
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
