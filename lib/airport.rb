require 'plane'
require 'weather_condition'

class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 15

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = Weather.new
    @plane = Plane.new
  end

  def instruct_plane_land(plane)
    fail @plane.unsucessful_land_bad_weather(plane) if bad_weather?
    fail @plane.unsucessful_land_hangar_full(plane) if full?
    @hangar << plane
    @plane.sucessful_land(plane)
  end

  def instruct_plane_take_off(plane)
    fail @plane.unsucessful_take_off_bad_weather(plane) if bad_weather?
    fail 'Hangar is empty, no plane to take off' if empty?
    @hangar.delete(plane)
    @plane.sucessful_take_off(plane)
  end

  private

  def bad_weather?
    @weather.stormy? ? true: false
  end

  def full?
    @hangar.count >= DEFAULT_CAPACITY
  end

  def empty?
    @empty = @hangar.empty?
  end

end
