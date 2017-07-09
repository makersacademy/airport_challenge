require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :plane, :weather, :capacity
  # def plane
  #   @plane
  # end

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    # fail 'Storms prevent landing' if weather.stormy?
    fail 'Airport full' if full?
    plane.flying = false
    plane.landed = true
    @plane = plane
    @planes << plane
  end

  def take_off(plane)
    fail 'No planes currently at the airport' if empty?
    fail 'Storms prevent take off' if weather.stormy?
    plane.flying = true
    plane.landed = false 
    @planes.delete(plane)
    @plane = nil
    "#{plane} has taken off"
  end

  private
  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end
