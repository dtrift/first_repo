module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods 

    def validate(attr_name, validation_type, other_attr = nil)
      @attr_name = attr_name
      @validation_type = validation_type
      @other_attr = other_attr
    end

  end

  module InstanceMethods

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    protected

    # validate :name, :presence
    # validate :number, :format, /A-Z{0,3}/
    # validate :station, :type, RailwayStation

    def presence
      raise 'Name can not be nil!' if @attr_name.empty? || @attr_name.nil?
    end

    def format
      raise 'Wrong format!' if @validation_type !~ @other_attr
    end

    def type
      raise 'Wrong type!' if @validation_type.class != @other_attr
    end

    def validate!

    end

  end

end
