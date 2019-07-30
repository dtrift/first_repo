# frozen_string_literal: true

class Route
  include InstanceCounter
  include Validation

  attr_reader :first_station, :last_station, :all_stations, :name

  validate :name, :presence

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, first_station, last_station)
    @name = name
    @all_stations = [first_station, last_station]
    @first_station = first_station
    @last_station = last_station
    @sum = 0
    validate!
    @@all << self
    register_instance
  end

  def add_station(station)
    @all_stations.insert(-2, station)
  end

  def delete_station(station)
    @all_stations.delete(station)
  end

end
