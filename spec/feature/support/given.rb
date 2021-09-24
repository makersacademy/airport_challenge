
def given_a_plane_waiting_to_land_at_an_airport
  p 'given_a_plane_waiting_to_land_at_an_airport'
  a_plane
  an_airport
end

def given_an_airport_with_clear_weather
  given_an_airport
  and_clear_weather
end

def given_an_airport_with_custom_capacity(capacity)
  p 'given_an_airport_with_custom_capacity'
  @weather_service = WeatherService.new
  @airport = Airport.new("My Airport", @weather_service, capacity)
end

def a_plane
  @plane = AeroplaneFactory.build_with_name("test plane")
end

def given_an_airport
  p 'given_an_airport'
  an_airport
end

def an_airport
  @weather_service = WeatherService.new
  @airport = Airport.new("My Airport", @weather_service)
end

def and_clear_weather
  p 'and_clear_weather'
  allow(@weather_service).to receive(:rand).and_return(10)
end

def and_bad_weather
  p 'and_bad_weather'
  allow(@weather_service).to receive(:rand).and_return(1)
end

def and_a_plane_waiting_to_take_off
  @airport.land_plane(a_plane)
end
