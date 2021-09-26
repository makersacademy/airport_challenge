def given_a_plane_and_an_airport_managed_by_atc
  atc_setup
  @atc.add_airport(single_airport)
  @atc.add_plane(single_plane)
end

def given_a_landed_plane_at_an_airport_managed_by_atc
  given_a_plane_and_an_airport_managed_by_atc
  clear_weather
  @atc.clear_for_landing(@airport.code, @plane.id)
  @atc.land(@airport.code, @plane.id)
end

def given_an_airport_full_of_planes
  atc_setup
  clear_weather
  @atc.add_airport(single_airport)
  20.times do 
    plane = AeroplaneFactory.build
    @atc.add_plane(plane)
    @atc.clear_for_landing(@airport.code, plane.id)
    @atc.land(@airport.code, plane.id)
  end
end

def given_an_airport_with_a_custom_capacity(capacity)
  atc_setup
  @airport = Airport.new("Test", :TEST, capacity)
  @atc.add_airport(@airport)
end

private

def atc_setup
  @weather_service = WeatherService.new
  @atc = AirTrafficControl.new(
    PlaneManagementService.new, 
    AirportManagementService.new, 
    @weather_service)
end

def single_airport
  @airport = AirportFactory.build
end

def single_plane
  @plane = AeroplaneFactory.build
end

def clear_weather
  allow(@weather_service).to receive(:weather_report).and_return :clear
end
