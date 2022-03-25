
class Airport
  require_relative 'weather'

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    "Plane landed at airport"
  end
  def take_off(plane)
    raise "It is too stormy to fly" if @weather.stormy?
    "Plane has taken off from airport"
  end
end