require_relative 'plane.rb'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes
  attr_accessor :capacity

  def initialize(planes = [], capacity = DEFAULT_CAPACITY)
    @planes = planes
    @capacity = capacity
  end

  def arrivals
    airport_full
    raise "Bad weather conditions to land" if Weather.stormy_weather?
    @planes << Plane.new
  end

  def departures
    airport_empty?
    raise "Bad weather conditions to depart" if Weather.stormy_weather?
    @planes.pop
    @planes
  end

  def airport_full
    raise "Airport is full" if @planes.length >= @capacity
  end

  def airport_empty?
    raise "No planes landed" if @planes.empty?
  end

  def capacity(capacity = @capacity)
    @capacity = capacity
  end

  def planes
    @planes
  end

end
