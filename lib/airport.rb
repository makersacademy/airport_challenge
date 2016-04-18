require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  DEFAULT_CAPACITY=20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @docked_planes = []
  end

  def land_plane(plane)
    fail 'Plane already docked in airport' if plane.docked?
    fail 'It is not safe for the plane to land' if bad_weather?
    fail 'Airport full' if full?
    plane.land
    puts 'The plane has successfully landed at the airport'
    docked_planes << plane
  end

  def launch_plane(plane)
    fail 'It is not safe for the plane to take off' if bad_weather?
    fail 'Plane is already airborne' unless plane.docked?
    fail 'Plane is not in this airport' unless docked_planes.include? plane
    plane.take_off
    puts 'The plane has successfully taken off from the airport'
    docked_planes.delete plane
  end

  private
  attr_accessor :docked_planes

  def full?
    docked_planes.length >= capacity
  end

  def bad_weather?
    stormy?
  end

end
