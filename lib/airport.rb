require_relative "weather"

class Airport
  include Weather

  StormErr = "The weather is stormy"
  AcceptErr = "Plane already at an airport"
  ReleaseErr = "Plane not at this airport"

  def initialize
    @planes = []
  end

  def accept plane
    fail AcceptErr unless ok_to_land? plane
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

  def ok_to_land? plane
    plane.flying?
  end

  def plane_in_airport? plane
    @planes.include? plane
  end
end
