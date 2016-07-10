require_relative 'plane'

class Airport

def safe_conditions?(weather_report)
  @weather = weather_report
end

def land_plane(plane)
  fail "Unable to land due to stormy conditions" if @weather == 'stormy'
  @plane = plane
  plane.landed?
end



end
