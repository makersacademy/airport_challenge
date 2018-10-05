class Traffic_Controller
  @weather = nil
  @plane = nil
  @airport = nil
  def initialize(airport)
    @airport = airport
    @weather = @airport.getWeather().downcase!
  end

  def planeLand(plane)
    @plane = plane
    if (@plane.getPlaneDestination.getWeather() != "stormy")
      @plane.land()
    else puts "The weather is too rough for the plane to land right now!"
    end
  end
  
  def planeTakeOff(plane)
    @plane = plane
    if(@plane.getPlaneLocation.getWeather() != "stormy")
      @plane.takeOff()
      @plane.setPlaneStatus("In Transit to #{@plane.getPlaneDestination().getAirportName()}")
    end
  end
end