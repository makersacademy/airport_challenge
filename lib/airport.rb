require_relative 'plane'
class Airport
  def initialize
    @planes = []
    @stormy_weather
  end
  public
  def land(plane)
    plane.land_plane
    planes << plane
  end

  def take_off(plane)
    planes.delete(plane)
  end

  def stormy_weather?
    random_number = rand(10)
    random_number > 8 ? stormy_weather = true : stormy_weather = false
  end

  private
  attr_reader :planes
  attr_reader :stormy_weather
end
