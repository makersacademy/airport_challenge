require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 100

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
        return true
      end
    end
    false
  end

  def takeoff_ok?(plane)
    unless weather_stormy?
      departing(plane)
      return true
    end
    false
  end

  private

  def capacity_ok?
    if @planes.length < @capacity
      true
    else
      puts "#{self} is full"
      false
    end
  end

  def weather_stormy?
    if @weather.stormy? ## rubocop doesn't like this for a style reason...
      puts "weather is stormy" # puting this here as i'm treating the weather as weather,
      true                     # and weather can't tell you anything. (the airport would)
    end
  end

  def landing(plane)
    @planes << plane
  end

  def departing(plane)
    @planes.delete(plane)
  end
end
