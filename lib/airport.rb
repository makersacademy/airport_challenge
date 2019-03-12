require 'plane'
require 'weather'


class Airport

  attr_reader :hangar, :capacity, :name, :weather

  DEFAULT_CAPACITY = 10

  def initialize(name = "LHR", capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hangar = []
    @capacity = capacity
    @name = name
    @weather = weather
  end

  def land(plane)
    raise "Landing not possible" unless @hangar.length < capacity
    raise "Not possibile -> Plane already landed" if @hangar.include? plane
    raise "Stormy weather: landing denied" if @weather == :stormy
    plane.land_at(self) 
    hangar << plane
    "Landed"
  end

  def takeoff(plane)
    raise "Stormy weather: Take off denied" if @weather == :stormy
    raise "Plane already flying" if flying?(plane)
    
    @hangar.delete(plane)
    change_plane_status(plane)
    plane.airport = nil if flying?(plane) 

    raise "Plane has not taken off yet" unless in_airport?(plane)

    "Plane has taken off"
  end

  private 

  def flying?(plane)
    plane.status == :flying
  end

  def in_airport?(plane)
    plane.airport.nil?
  end

  def change_plane_status(plane)
    plane.status == :flying ? plane.status = :landed : plane.status = :flying
  end

end

