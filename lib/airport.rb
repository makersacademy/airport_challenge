require 'weather'

class Airport
  include Weather
  attr_accessor :hangar, :capacity, :weather

  def initialize(capacity = 100)
    @hangar = [] 
    @capacity = capacity
    @weather = weather_report
  end

  def harbour_plane(plane)
    raise Errors::STORMY_WEATHER_ON_LANDING if @weather == "stormy"
    raise Errors::AT_CAPACITY if @hangar.length == @capacity

    @hangar.push plane
  end

  def commission_flight(plane)
    raise Errors::NOT_AT_AIRPORT unless @hangar.include? plane
    raise Errors::STORMY_WEATHER_ON_TAKEOFF if @weather == "stormy"

    @hangar.delete(plane)
  end
end
