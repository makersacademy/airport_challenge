require_relative 'weather'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land_plane(plane)
    @hangar << plane
  end

  def take_off(weather)
    @hangar.pop unless weather.stormy?
  end

end
