require_relative './plane.rb'
require_relative './weather.rb'

# Understands storing planes and managing take-off/landing
class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :hangar, :hangar_capacity

  def initialize(hangar_capacity = DEFAULT_CAPACITY)
    @hangar_capacity = hangar_capacity
    @hangar = []
  end

  def land_plane(plane)
    # while weather.sunny?
    plane.change_status
    hangar << plane
    'Plane has successfully landed'
  end

  def take_off_plane
    remove_plane_from_hangar
    # plane.change_status
    'Plane has successfully taken off'
  end

  def remove_plane_from_hangar

  end
end
