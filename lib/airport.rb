require_relative "weather"

class Airport
  include Weather

  Default_Capacity = 1
  StormErr = "The weather is stormy"
  AcceptErr = "Plane already at an airport"
  ReleaseErr = "Plane not at this airport"
  CapacityErr = "Airport is full"

  def initialize
    @planes = []
    @capacity = Default_Capacity
  end

  def accept plane
    fail AcceptErr unless plane_flying? plane
    fail CapacityErr if full?
    fail StormErr if stormy?
    plane.land
    store_plane plane
  end

  def release plane
    fail ReleaseErr unless plane_in_airport? plane
    fail StormErr if stormy?
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
