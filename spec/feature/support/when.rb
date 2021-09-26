def when_the_weather_is_clear
  allow(@weather_service).to receive(:weather_report).and_return :clear
end

def when_the_weather_is_bad
  allow(@weather_service).to receive(:weather_report).and_return :storm
end 

def and_the_airport_reaches_capacity
  plane = AeroplaneFactory.build
  @atc.add_plane(plane)
  @atc.clear_for_landing(@airport.code, plane.id)
  @atc.land(@airport.code, plane.id)
end
