require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 30

  attr_reader   :planes, :airborne_planes, :weather
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @airborne_planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise "Error - Plane not airborne" if plane.airborne? == false
    raise "Cannot land due to bad weather" if stormy?
    raise "Airport full...jog on" if full?
    successful_landing(plane)
  end

  def successful_landing(plane)
    airborne_planes.delete(plane)
    plane.plane_status(:landed)
    planes << plane
    "The plane has successfully landed"
  end

  def take_off(plane)
    raise "Error - Plane not at airport" if plane.airborne? == true
    raise "Cannot take off due to bad weather" if stormy?
    successful_take_off(plane)
  end

  def successful_take_off(plane)
    planes.delete(plane)
    plane.plane_status(:airborne)
    airborne_planes << plane
    "Taken off successfully"
  end

  private

  def stormy?
    @weather.stormy?
  end

  def full?
     planes.size >= capacity
  end

end
