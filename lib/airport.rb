require 'weather'
require 'plane'
require 'sky'

class Airport
  include Weather
  attr_reader :hangar, :capacity, :airspace
  attr_accessor :weather

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY, airspace = Sky.new)
    @hangar = [] 
    @capacity = capacity
    @weather = weather_report
    @airspace = airspace
  end

  def harbour_plane(plane)
    raise Errors::NOT_A_PLANE unless plane.is_a? Plane
    raise Errors::STORMY_WEATHER_ON_LANDING if weather == :stormy
    raise Errors::AT_CAPACITY if hangar.length == capacity

    plane.land
    hangar.push plane
    airspace.planes_in_transit.delete plane
  end

  def commission_flight(plane)
    raise Errors::NOT_AT_AIRPORT unless hangar.include? plane
    raise Errors::STORMY_WEATHER_ON_TAKEOFF if weather == :stormy

    plane.take_off
    airspace.planes_in_transit.push plane
    hangar.delete plane
  end
end
