require_relative 'plane'
require_relative 'weather'

class Airport
  
  attr_accessor :planes, :plane, :plane_status, :runway_open, :airport_capacity     
  
  def initialize (capacity = 20)
    @planes = []
    @airport_capacity = capacity    #Set to 20 if no capacity is provided.
    @runway_open = true
  end
  
  def is_plane_at_airport?(plane)
    planes.include? plane
  end
  
  def airport_open?
    weather_forecaster == "good" ? @runway_open = true : @runway_open = false
  end
  
  def is_airport_full?
    planes.count == airport_capacity ? true : false
  end
    
  def land_plane(plane)
    fail "You cannot land because the airport is full." if is_airport_full?
    fail "ERROR: That plane has already landed." if is_plane_at_airport?(plane)
    fail "ERROR: There is no plane to land." if (plane.nil? || plane.class.to_s != "Plane")
    @plane_status = "up"
    plane.plane_status = "up"       #Sets plane status
    if airport_open?                #Checks weather on "land_plane" call
      planes << plane
      @plane_status = "down"
      plane.plane_status = "down"
    else
      puts "Weather is too stormy to allow planes to land." 
    end
  end
  
  def take_off(plane = planes[0])
    fail "ERROR: There is no plane to take-off." if planes.empty? || !is_plane_at_airport?(plane)   # || plane.class.to_s != "Plane")
    @plane_status = "down"
    plane.plane_status = "down"
    if airport_open?     #Checks weather on "take_off" call
      plane_up = planes.delete(plane)
      plane_up.plane_status = "up"
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
