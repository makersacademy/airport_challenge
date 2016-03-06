require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :hangar, :clear, :current_weather

  def initialize
    @hangar = []
    @clear = true
    @current_weather
  end

  def check_weather(weather)
    @current_weather = weather.stormy
  end

  def land_plane(plane)
    @hangar << plane.landed
    plane
  end

  def take_off(planes)
    if @hangar.empty? || @current_weather == false
      @hangar.map { |plane| plane.takeoff  }
      @hangar.pop
    else
      raise "No takeoff in stormy weather"
    end
  end

  def planes_in_hangar
    @hangar
  end

  def plane_status(plane)
    plane.flying?
  end
end
