require_relative 'weather'
require_relative 'plane'

class Airport
attr_reader :weather, :planes, :capacity
DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise 'Cannot land because of bad weather' if self.weather.stormy?
    raise 'Cannot land because airport is at capacity' if full?
    planes << plane
  end

  def landed?(plane)
    true
  end

  def take_off(plane)
    if self.weather.stormy?
      raise 'Cannot take off because of the bad weather'
    else
      true
    end
  end

  def departed?(plane)
    true
  end

  def full?
    planes.count >= capacity
  end


end







