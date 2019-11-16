require 'weather'

class Airport
  include Weather
  attr_accessor :planes, :capacity, :weather

  def initialize(capacity = 100)
    @planes = [] 
    @capacity = capacity
    @weather = weather_report
  end

  def harbour_plane(plane)
    raise Errors::STORMY_WEATHER_ON_LANDING if @weather == "stormy"
    raise Errors::AT_CAPACITY if @planes.length == @capacity

    @planes.push plane
  end

  def commission_flight(plane)
    raise Errors::NOT_AT_AIRPORT unless @planes.include? plane
    raise Errors::STORMY_WEATHER_ON_TAKEOFF if @weather == "stormy"

    @planes.delete(plane)
  end
end
