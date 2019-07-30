# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation

  attr_reader :name, :cargo, :passenger

  validate :name, :precence

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @all_trains = []
    @cargo = 0
    @passenger = 0
    validate!
    @@all << self
    register_instance
  end

  def show_all_trains
    @all_trains.each { |train| yield(train) }
  end

  def get_train(train)
    @all_trains << train
    if train.type == :cargo
      @cargo += 1
    else
      @passenger += 1
      return @cargo, @passenger
    end
  end

  def send_train(train)
    @all_trains.delete(train)
    if train.type == :cargo
      @cargo -= 1
    else
      @passenger -= 1
      return @cargo, @passenger
    end
  end

end
