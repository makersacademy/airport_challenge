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

  def hangar_empty?
    hangar.length < 1
  end

  def land_plane(plane)
    raise 'It is too stormy to land!' if weather.stormy?
    raise 'The hangar is full!' if hangar_full?
    plane.change_status
    hangar << plane
  end

  def take_off_plane
    raise 'It is too stormy to take-off!' if weather.stormy?
    hangar_empty? ? (raise 'No planes!') : remove_plane_from_hangar
  end

  def remove_plane_from_hangar
    hangar.pop.change_status
    'A plane had been removed from the hangar!'
  end
end
