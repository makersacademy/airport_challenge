require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :capacity, :flying

  # number of planes already in hangar can be specified through an argument
  # if given
  def initialize(no_of_planes = 0, capacity = 20)
    @hangar = []
    @capacity = capacity
    no_of_planes.times { @hangar << Plane.new } unless no_of_planes > capacity
  end

  # this method request to land a plane
  def request_to_land(plane)
    todays_weather = weather_report
    raise 'The hangar is currently full' if @hangar.length >= capacity
    fail 'There is no plane to land' if @flying == nil
    raise 'You cannot land due to stormy weather' if todays_weather == 'stormy'
    land_plane(plane)
  end

  def land_plane(plane)
    p 'The plane has landed'
    @hangar.push(plane)
    @flying = nil
    @hangar
  end

  def take_off
    p 'The plane has taken off'
    @flying = @hangar.shift
  end

  # this method returns either 'sunny' or 'stormy'
  def weather_report
    weather = Weather.new
    weather.current_weather
  end
end
