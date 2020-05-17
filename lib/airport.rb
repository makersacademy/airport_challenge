require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 2

  attr_accessor :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @capacity = cap
    @planes = []
    @weather = Weather.new
  end

  def landing_ok?(plane)
    unless weather_stormy?
      if @planes.length < @capacity
        landing(plane)
        true
      else
        puts "#{self} is full"
        false
      end
    else
      false
    end
  end

  def weather_stormy?
    if @weather.stormy?
      puts "weather is stormy"
      true
    else
      false
    end
  end

  def takeoff_ok?(plane)
    departing(plane) unless Weather.new.stormy?
  end

  def landing(plane)
    @planes << plane
  end

  def departing(plane)
    @planes.delete(plane)
  end
end
