require_relative 'plane'
require_relative 'weather'

class Airport
  
  attr_accessor :planes, :plane, :plane_status, :runway_open     
  
  def initialize
    @planes = []
  end
  
  def airport_open?
    weather_forecaster == "good" ? @runway_open = true : @runway_open = false
  end
    
  def land_plane(plane)
    fail "ERROR: There is no plane to land." if (plane.nil? || plane.class.to_s != "Plane")
    @plane_status = "up"
    if airport_open?      #Checks weather on "land_plane" call
      planes << plane
      @plane_status = "down"
    else
      puts "Weather is too stormy to allow planes to land." 
    end
  end
  
  def take_off(plane = planes[0])
    fail "ERROR: There is no plane to take-off." if planes.empty?   # || plane.class.to_s != "Plane")
    @plane_status = "down"
    if airport_open?     #Checks weather on "take_off" call
      planes.delete(plane)
      #planes.pop
      @plane_status = "up"
    else
      puts "Weather is too stormy to allow planes to take-off." 
    end
  end
    
end

=begin
#Cannot land a plane if there is no plane object.
airport = Airport.new
plane = Plane.new
airport.land_plane(plane)
  #plane = "I'm a little aeroplane up in the sky"
  #airport.land_plane(plane)
  #plane = nil
  #airport.land_plane(plane)
=end

=begin
airport = Airport.new
plane = Plane.new
puts "PLANE INSTRUCTED TO LAND - will not if weather is stormy"
airport.land_plane(plane)
puts "Is the runway open?: #{airport.runway_open}"
puts "Array of planes at airport: #{airport.planes.inspect}"
puts "Plane status is: #{airport.plane_status}"
puts
plane = Plane.new
airport.planes << plane
puts "PLANE INSTRUCTED TO TAKE-OFF - will not if weather is stormy"
airport.take_off
puts "Is the runway open?: #{airport.runway_open}"
puts "Array of planes at airport: #{airport.planes.inspect}"
puts "Plane status is: #{airport.plane_status}"

=end


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