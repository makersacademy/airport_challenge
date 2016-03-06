require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :hangar, :clear, :capacity, :full

  def initialize
    @full = "room to land"
    @capacity = 20
    @hangar = []
    @clear = "good weather"
  end

  def current_weather(weather)
    @clear = weather.current
  end

  def land_plane(plane)
    if @clear == "bad weather" || @full == "hangar is full"
      "can't land"
    else
      @hangar << plane
      @hangar.map { |planes| planes.landed  }
      plane
    end
  end

  def hangar_status
    if @hangar.length < 20
      @full
    else
      @full = "hangar is full"
    end
  end

  def take_off(planes)
    if @clear == "bad weather"
      "cant take off"
    else
      @hangar.map { |plane| plane.takeoff  }
      @hangar.pop
    end
  end

  def planes_in_hangar
    @hangar
  end

  def plane_status(plane)
    plane.flying?
  end
end
