class Airport

  DEFAULT_CAPACITY = 1

  def initialize(plane=nil, capacity=DEFAULT_CAPACITY)
    @plane = plane
    @weather = get_weather
    @capacity = capacity
  end

  attr_accessor :plane
  attr_accessor :weather
  attr_reader :capacity

  def get_weather
    Weather.new.the_weather
  end

  def land(plane)
    self.plane= plane
  end

  def takeoff(plane)
    self.plane= nil
  end

  def stormy?
    self.weather == 'stormy'
  end

  def full?
    self.plane != nil
  end
end
