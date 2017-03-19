require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 30

  attr_reader   :planes
  attr_reader   :airborne_planes
  attr_reader   :weather
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @airborne_planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land due to bad weather" if stormy?
    raise "Airport full...jog on" if full?
    update_land_status(plane)
    plane.landed?
  end

  def update_land_status(plane)
    airborne_planes.delete(plane)
    planes << plane
  end

  def take_off(plane)
    raise "Cannot take off due to bad weather" if stormy?
    update_airborne_status(plane)
  end

  def update_airborne_status(plane)
    planes.delete(plane)
    airborne_planes << plane
  end

  private

  def stormy?
    @weather.stormy?
  end

  def full?
     planes.size >= capacity
  end

end
