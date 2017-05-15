require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :landed_planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def instruct_land(plane)
    fail "Cannot land when it's stormy" if bad_conditions?
    fail "Cannot land when airport is full" if airport_full?
    # p "GET VISIBILITY #{plane.flying}"

    fail "Cannot land when plane is landed" unless plane.flying
    plane.land
    @landed_planes << plane
    'Plane has landed'
  end

  def instruct_plane_takeoff(plane)
    fail "Cannot take off when it's stormy" if bad_conditions?
    fail "Cannot takeoff when plane is flying" if plane.flying
    fail "Cannot take off when there are no planes available" if @landed_planes.empty?
    fail 'Cannot instruct plane to takeoff in another airport' unless @landed_planes.include?(plane)
    plane.takeoff
    @landed_planes.delete(plane)
    'Plane has taken off'
  end

  def bad_conditions?
    @weather.stormy?
  end

  private
  def airport_full?
    @landed_planes.length >= @capacity
  end

end
