require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :take_off, :stormy, :full
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = [] #in airport
    @weather = Weather.new.todays_forecast
    @capacity = DEFAULT_CAPACITY
  end

  def stormy?
    @weather == "stormy"
  end

  def full?
     planes.size == @capacity
  end

  def land(plane)
    raise "It isn't safe to land." if stormy?
    raise "The airport is full, you must wait." if full?
    planes << plane
  end

  def take_off(plane)
    raise "It isn't safe to fly." if stormy?
    raise "There are no planes in the airport." if planes.empty?
    planes.delete(plane)
  end
end
