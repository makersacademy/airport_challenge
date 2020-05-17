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
      if capacity_ok?
        landing(plane)
        true
      else
        false
      end
    else
      false
    end
  end

  def capacity_ok?
    if @planes.length < @capacity
      true
    else
      puts "#{self} is full"
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
    unless weather_stormy?
      departing(plane)
      true
    else
      false
    end
  end

  def landing(plane)
    @planes << plane
  end

  def departing(plane)
    @planes.delete(plane)
  end
end
