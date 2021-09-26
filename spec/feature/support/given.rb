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