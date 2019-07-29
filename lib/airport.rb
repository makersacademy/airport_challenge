require_relative './weather.rb'
require_relative './plane.rb'

class Airport
  attr_reader :capacity, :planes

  DEFAULT_CAPACITY = 5

  ERR_STORMY_LAND = "The weather conditions are too poor to allow a plane to land"
  ERR_STORMY_TAKEOFF = "The weather conditions are too poor to allow a plane to takeoff"
  ERR_CAPACITY = "The airport is currently full."
  ERR_DUPLICATE_PLANE = "The airport has detected a duplicate plane."
  ERR_MISSING_PLANE = "Plane cannot be found"
  ERR_PLANE_BAD_STATE = "Plane is in the incorrect state for instruction"

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def build_plane
    raise ERR_CAPACITY if full?

    # defending against the edgiest of cases.
    nu_plane = Plane.new(false)
    raise ERR_DUPLICATE_PLANE if plane_exists?(nu_plane) # impossible to happen since new is being called

    @planes << nu_plane
    nu_plane
  end

  def land(plane)

    raise ERR_DUPLICATE_PLANE if plane_exists?(plane)
    raise ERR_PLANE_BAD_STATE unless plane.flying?
    raise ERR_CAPACITY if full?
    raise ERR_STORMY_LAND if @weather.stormy?

    plane.land
    @planes << plane
    plane
  end

  def takeoff(plane)
    raise ERR_MISSING_PLANE unless plane_exists?(plane)
    raise ERR_PLANE_BAD_STATE if plane.flying?
    raise ERR_STORMY_TAKEOFF if @weather.stormy?

    plane.takeoff
    @planes.delete(plane) # this is safe since duplicate planes are checked
  end

  def plane_exists?(plane)
    @planes.include?(plane)
  end

  private
  def full?
    @planes.count >= @capacity
  end
end
