require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :capacity, :flying, :plane_class
  # constant decalring the default capacity
  DEF_CAP = 20

  # number of planes already in hangar can be specified through an argument
  # if given
  def initialize(capacity = DEF_CAP, plane_class = Plane.new)
    @hangar = []
    @capacity = capacity
    @plane_class = plane_class
  end

  def number_of_planes(num)
    num.times { @hangar.push(@plane_class) } unless num + @hangar.length > capacity
  end

  # this method requests to land a plane
  def request_to_land(plane, weather_class = Weather.new)
    todays_weather = weather_class.randomize
    raise 'The hangar is currently full' if @hangar.length >= capacity
    raise 'You cannot land due to stormy weather' if todays_weather == :stormy
    fail 'There is no plane to land' if @flying.nil?
    land_plane(plane)
  end

  # this method feeds to request_to_land
  def land_plane(plane)
    p 'The plane has landed'
    hangar.push(plane)
    @flying = nil
    hangar
  end

  # this method requests for a plane to leave
  def request_take_off(weather_class = Weather.new)
    todays_weather = weather_class.randomize
    raise 'There are no planes in the hangar' if hangar.empty?
    raise 'You cannot leave due to stormy weather' if todays_weather == :stormy
    take_off
  end

  # this method feeds to request_take_off
  def take_off
    p 'The plane has taken off'
    @flying = hangar.shift
  end
end
