require './lib/plane'
require './lib/weather_report'

class Airport
  include Weather
  DEFAULT_CAPACITY = 50
  attr_reader :plane_capacity, :flying
  
  def initialize(plane_capacity = DEFAULT_CAPACITY)
    @planes = []
    @plane_capacity = plane_capacity
    @weather = stormy?
  end

  def land(arriving_plane)
    fail 'No capacity at airport' if full?
    fail 'Conditions too stormy to land' if stormy?
    # fail 'Plane already landed' if arriving_plane.flying == false
    @planes << arriving_plane
    arriving_plane.landed?
    arriving_plane
  end

  def take_off(departing_plane)
    fail 'Conditions too stormy to take off' if stormy?
    # fail 'Plane already airborne' if departing_plane.flying == true
    departing_plane.taken_off?
    @planes.pop
  end

  def full?
    @planes.count == @plane_capacity
  end
end
