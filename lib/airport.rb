require_relative './plane.rb'
require_relative './weather.rb'

# Understands storing planes and managing take-off/landing
class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :hangar, :hangar_capacity, :weather

  def initialize(hangar_capacity = DEFAULT_CAPACITY)
    @hangar_capacity = hangar_capacity
    @hangar = []
    @weather = Weather.new
  end

  def hangar_full?
    hangar.length == hangar_capacity
  end

  def land_plane(plane)
    raise 'It is too stormy to land!' if weather.stormy?
    raise 'The hangar is full!' if hangar_full?
    plane.change_status
    hangar << plane
    'Plane has successfully landed'
  end

  def take_off_plane
    raise 'It is too stormy to take-off!' if weather.stormy?
    remove_plane_from_hangar
    # plane.change_status
    'Plane has successfully taken off'
  end

  def remove_plane_from_hangar
    released_plane = hangar.first
    released_plane
  end
end
