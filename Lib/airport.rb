require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :hangar, :clear

  def initialize
    @hangar = []
    @clear = "good weather"
  end

  def current_weather(weather)
    @clear = weather.current
  end

  def land_plane(plane)
    @hangar << plane
    @hangar.map { |planes| planes.landed  }
    plane
  end

  def take_off(planes)
    if @clear == "good weather"
      @hangar.map { |plane| plane.takeoff  }
      @hangar.pop
    else
      "cant take off"
    end
  end

  def planes_in_hangar
    @hangar
  end

  def plane_status(plane)
    plane.flying?
  end
end
