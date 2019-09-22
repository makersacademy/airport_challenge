require_relative 'airport'
require_relative 'plane'


plane = Plane.new
airport = Airport.new

airport.take_off(plane)


  def take_off(plane)
    check_in_the_air(plane)
    check_weather(plane)
    plane.report_flying
    @planes.delete(plane)
  end   
   

  def check_in_the_air(plane)
    fail 'Error: You have already taken off' if plane.flying == true 
  end

    
  def check_weather
    weather
    fail 'Error: Too stormy' if @weather == :stormy
  end


  
 
