class Airport

  DEFAULT_CAPACITY = 1

  def initialize(planes=[], capacity=DEFAULT_CAPACITY)
    @planes = planes
    @weather = get_weather
    @capacity = capacity
  end

  attr_accessor :planes
  attr_accessor :weather
  attr_reader :capacity

  def get_weather
    Weather.new.the_weather
  end

  def land(plane)
    self.planes << plane
  end

  def takeoff(plane)
    planes.delete(plane)
  end

  def stormy?
    self.weather == 'stormy'
  end

  def full?
    planes.length == self.capacity
  end
end
