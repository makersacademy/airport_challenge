def given_a_plane_and_an_airport_managed_by_atc
  @weather_service = WeatherService.new
  @atc = AirTrafficControl.new(
    PlaneManagementService.new, 
    AirportManagementService.new, 
    @weather_service
  )
  
  @plane = AeroplaneFactory.build
  @airport = AirportFactory.build

  @atc.add_airport(@airport)
  @atc.add_plane(@plane)
end

def given_a_landed_plane_at_an_airport_managed_by_atc
  allow(@weather_service).to receive(:weather_report).and_return :clear
  given_a_plane_and_an_airport_managed_by_atc
  @atc.clear_for_landing(@airport.code, @plane.id)
  @atc.land(@airport.code, @plane.id)
  p @atc.find_airport_by_code(@airport.code)
end