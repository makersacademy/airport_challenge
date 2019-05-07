class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise 'Unable to land; stormy weather.' if weather_permit?
    raise 'Unable to land; airport full.' if airport_full?
    
    planes << plane
  end

  def take_off(plane)
    raise 'Unable to take-off; stormy weather.' if weather_permit?

    planes.delete(plane)
  end

  def weather_permit?
    weather.check == 'stormy'
  end

  def airport_full?
    planes.length >= capacity
  end
end
