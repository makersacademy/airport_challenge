require_relative 'plane'

class Airport

  attr_accessor :weather, :capacity, :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = current_weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'This Airport is full' if full?
    current_weather
    fail 'Too stormy to try landing' if stormy?
    @planes << plane.land(self)
  end

  def take_off(plane)
    fail 'Plane not at this airport' unless @planes.include?(plane)
    current_weather
    fail 'Too stormy to try take off' if stormy?
    @planes.delete(plane.take_off)
  end

  private

  def current_weather
    set = rand(10)
    set.positive? ? @weather = 'fine' : @weather = 'stormy'
  end

  def stormy?
    @weather == 'stormy'
  end

  def full?
    @planes.length >= @capacity
  end

end
