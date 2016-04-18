require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  DEFAULT_CAPACITY=20
  attr_reader :capacity
  attr_accessor :docked_planes


  def initialize(capacity = DEFAULT_CAPACITY, planes=Plane.new)
    @capacity = capacity
    @docked_planes = []
    @planes = planes
  end

  def land_plane(plane)
    fail 'It is not safe for the plane to land' if bad_weather?
    fail 'Airport full' if full?
    docked_planes << plane
    plane.land
  end

  def launch_plane(plane)
    fail 'It is not safe for the plane to take off' if bad_weather?
    docked_planes.pop
    plane.take_off
  end

  private

  attr_reader :planes

  def full?
    docked_planes.length >= capacity
  end

  def empty?
    docked_planes.empty?
  end

  def bad_weather?
    stormy?
  end

  def land
    planes.land
  end

  def take_off
    planes.take_off
  end

end
