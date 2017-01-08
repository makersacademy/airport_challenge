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
    if bad_conditions?
      raise "Bad weather conditions to land"
    else
      @planes << Plane.new
    end
  end

  def departures
    airport_empty?
    if bad_conditions?
      raise "Bad weather conditions to depart"
    else
      @planes.pop
    end
    @planes
  end

  def bad_conditions?
    Weather.stormy_weather?
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
