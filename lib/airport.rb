require_relative "weather"

class Airport
  include Weather
  def initialize
    @planes = []
  end

  def accept plane
    raise "Plane is already at an airport" unless ok_to_land? plane
    plane.land
    store_plane plane
  end

  def release plane
    raise "Plane is not at this airport" unless plane_in_airport? plane
    raise "The weather is stormy" if stormy?
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
