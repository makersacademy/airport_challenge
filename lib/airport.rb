require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  DEFAULT_CAPACITY=20
  attr_reader :capacity
  attr_accessor :docked_planes


  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @docked_planes = []
  end

  def land_plane(plane)
    fail 'It is not safe for the plane to land' if bad_weather?
    fail 'Airport full' if full?
    plane.land
    docked_planes << plane
  end

  def launch_plane(plane)
    fail 'It is not safe for the plane to take off' if bad_weather?
    fail 'Airport empty' if empty?
    plane.take_off
    docked_planes.pop
  end

  private

  def full?
    docked_planes.length >= capacity
  end

  def empty?
    docked_planes.empty?
  end

  def bad_weather?
    stormy?
  end

end
