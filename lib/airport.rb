require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :plane_capacity

  DEFAULT_CAPACITY = 5

  def initialize
    @parked_planes = []
    @plane_capacity = DEFAULT_CAPACITY
  end

  def land(plane, weather)
    fail "That isn't a plane!" unless plane.ping == 'I am a plane.'
    fail 'Weather is too stormy to land!' unless clear_weather?(weather)
    fail 'Airport cannot land any more planes at present!' if full?
    fail 'Plane is already parked here!' if confirm_arrival(plane)
    plane.land(self)
    @parked_planes.push(plane)
  end

  def confirm_arrival(plane)
    @parked_planes.include?(plane)
  end

  def takeoff(plane, weather)
    fail 'Plane is not parked here!' unless confirm_arrival(plane)
    fail 'Weather is too stormy to take off!' unless clear_weather?(weather)
    plane.takeoff
    @parked_planes.delete_at(find_plane(plane))
  end

  def confirm_departure(plane)
    !@parked_planes.include?(plane)
  end

  def override_capacity(new_capacity)
    fail 'Please enter an integer >= 0' if new_capacity.negative?
    fail 'Please enter an integer >= 0' unless new_capacity.integer?
    @plane_capacity = new_capacity
  end

  def ping
    'I am an airport.'
  end

  private

  def find_plane(plane)
    @parked_planes.index(plane)
  end

  def clear_weather?(weather)
    weather.report == :clear
  end

  def full?
    @parked_planes.count >= @plane_capacity
  end

end
