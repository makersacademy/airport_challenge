# Airport class

class Airport 
  attr_reader :planes
  attr_reader :capacity
  
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise 'Airport cannot accept more planes: Full' if full?
    
    raise 'Cannot land: Weather stormy' if stormy?

    @planes << plane
  end

  def take_off
    raise 'Cannot take off: Weather stormy' if stormy?
    @planes.pop
  end

  private
  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end
end
