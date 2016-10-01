require_relative 'plane'
require_relative 'weather'

class Airport
  
  attr_accessor :planes, :plane, :plane_status
  
  def initialize
    @planes = []
  end
  
  def weather_good?
    weather = weather_forecaster
  end
    
  def land_plane(plane)
    planes << plane
    plane_status = "down"
  end
  
  def take_off
    planes.pop
    plane_status = "up"
  end
    
end

airport = Airport.new
plane = Plane.new
puts airport.land_plane(plane)
puts airport.planes.inspect

puts airport.take_off
puts airport.planes.inspect

puts airport.weather_good?

#puts plane.plane_status
#puts plane.take_off
#puts plane.plane_status


=begin
#require_relative 'bike'
require_relative 'plane'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity
  attr_reader :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
   @bikes = []
   @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full'  if full?
    @bikes << bike
  end

  private


  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end


=end