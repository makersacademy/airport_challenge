require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :planes, :take_off, :stormy, :full

  DEFAULT_CAPACITY = 10

  def initialize
    @planes = [] #in airport
    @weather = Weather.new.todays_forecast
  end

  def stormy?
    @weather == "stormy" ? true : false
  end

  def full?
     @planes.size == DEFAULT_CAPACITY
  end

  def land(plane)
    raise "It isn't safe to land." if stormy?
    raise "The airport is full, you must wait." if full?
    @planes << plane
  end

  def take_off(plane)
    raise "It isn't safe to fly." if stormy?
    @planes.delete(plane)
  end
end
