require 'plane.rb'

class Airport
  attr_accessor :parked_planes, :plane_capacity
  DEFAULT_CAPACITY = 5

  def initialize
    @parked_planes = []
    @plane_capacity = DEFAULT_CAPACITY
  end

  def park_plane(plane)
    @parked_planes.push(plane)
  end

  def find_plane(plane)
    @parked_planes.index(plane)
  end

  def land(plane, weather)
    fail 'Weather is too stormy to land!' unless clear_weather?(weather)
    fail 'Airport cannot land any more planes at present!' if full?
    plane.land
  end

  def launch_plane(plane)
    @parked_planes.delete_at(find_plane(plane))
  end

  def takeoff(plane, weather)
    fail 'Weather is too stormy to take off!' unless clear_weather?(weather)
    plane.takeoff
  end

  def confirm_departure(plane)
    !@parked_planes.include?(plane)
  end

  def clear_weather?(weather)
    weather.report == 'clear'
  end

  def full?
    @parked_planes.count >= DEFAULT_CAPACITY
  end

  def overide_capacity(new_capacity)
    @plane_capacity = new_capacity
  end

end
