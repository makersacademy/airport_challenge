require_relative "weather"

class Airport
  include Weather

  DEFAULT_CAPACITY = 1
  STORM_ERR = "The weather is stormy"
  ACCEPT_ERR = "Plane already at an airport"
  RELEASE_ERR = "Plane not at this airport"
  FULL_ERR = "Airport is full"

  def initialize capacity=Default_Capacity
    @planes = []
    @capacity = capacity
  end

  def accept plane
    fail ACCEPT_ERR unless plane_flying? plane
    fail FULL_ERR if full?
    fail STORM_ERR if stormy?
    plane.land
    store_plane plane
  end

  def release plane
    fail RELEASE_ERR unless plane_in_airport? plane
    fail STORM_ERR if stormy?
    plane.take_off
    remove_plane plane
  end

  private
  attr_reader :planes

  def store_plane plane
    @planes << plane
  end

  def remove_plane plane
    @planes.delete plane
  end

  def plane_flying? plane
    plane.flying?
  end

  def plane_in_airport? plane
    @planes.include? plane
  end

  def full?
    @planes.count == @capacity
  end
end
