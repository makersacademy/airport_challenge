require_relative "weather"

class Airport
  include Weather

  DEFAULT_CAPACITY = 1
  STORM_ERR = "The weather is stormy"
  ACCEPT_ERR = "Plane already at an airport"
  RELEASE_ERR = "Plane not at this airport"
  FULL_ERR = "Airport is full"

  def initialize capacity=DEFAULT_CAPACITY
    @planes = []
    @capacity = capacity
  end

  def accept plane
    abort_landing plane unless ok_to_land? plane
    tell_to_land plane
    store_plane plane
  end

  def release plane
    abort_take_off plane unless ok_to_take_off? plane
    tell_to_take_off plane
    remove_plane plane
  end

  private
  attr_reader :planes, :capacity

  def plane_flying? plane
    plane.flying?
  end

  def full?
    planes.count == capacity
  end

  def ok_to_land? plane
    (plane_flying? plane) && !full? && !stormy?
  end

  def abort_landing plane
    fail ACCEPT_ERR unless plane_flying? plane
    fail FULL_ERR if full?
    fail STORM_ERR if stormy?
  end

  def tell_to_land plane
    plane.land
  end

  def store_plane plane
    @planes << plane
  end

  def plane_in_airport? plane
    planes.include? plane
  end

  def ok_to_take_off? plane
    (plane_in_airport? plane) && !stormy?
  end

  def abort_take_off plane
    fail RELEASE_ERR unless plane_in_airport? plane
    fail STORM_ERR if stormy?
  end

  def tell_to_take_off plane
    plane.take_off
  end

  def remove_plane plane
    @planes.delete plane
  end

end
