require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :in_air, :in_airport, :take_off, :stormy, :full

  DEFAULT_CAPACITY = 10

  def initialize
    @in_airport = []
    @in_air = []
    @weather = Weather.new.todays_forecast
  end

  def stormy?
    @weather == "stormy" ? true : false
  end

  def full?
     @in_airport.size == DEFAULT_CAPACITY
  end

  def land(plane)
    raise "It isn't safe to land." if stormy?
    raise "The airport is full, you must wait." if full?
    @in_airport.push(plane)
  end

  def take_off(plane)
    raise "It isn't safe to fly." if stormy?
    @in_air.push(plane)
  end
end
