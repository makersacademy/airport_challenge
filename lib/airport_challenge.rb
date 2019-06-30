require_relative 'weather'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land_plane(plane, weather)
    @hangar << plane unless weather.stormy? || hangar_full?
  end

  def take_off(weather)
    @hangar.pop unless weather.stormy?
  end

  private def hangar_full?
    @hangar.length == 1
  end

end
