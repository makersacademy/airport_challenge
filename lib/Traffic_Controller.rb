class Traffic_Controller
  @weather = nil
  @plane = nil
  @airport = nil
  def self.Traffic_Controller(airport)
    @airport = airports
    @weather = @airport.getWeather().downcase!
  end

  def planeLand(plane)
    while (@weather != "stormy") do
      @plane = plane
      @plane.land(@airport.getAirportId())
    end
  end
  
  def planeTakeOff(plane)
    while (@weather != "stormy") do
      @plane = plane
      @plane.takeOff(@airport.getAirportId())
    end
  end
end