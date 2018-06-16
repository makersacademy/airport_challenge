require_relative './plane.rb'
require_relative './weather.rb'

# Understands storing planes and managing take-off/landing
class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :hangar

  def initialize(hangar_capacity = DEFAULT_CAPACITY)
    @hangar_capacity = hangar_capacity
    @hangar = []
  end

  def land_plane(plane)
    plane.change_status
    hangar << plane
    'Plane has successfully landed'
  end

  def take_off_plane
    
  end

end
