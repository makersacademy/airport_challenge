require_relative 'plane'

class Airport

def safe_conditions?(weather_report)
  @weather = weather_report
end

def clear?
end

def land_plane(plane)
  fail "Unable to land due to stormy conditions" if @weather == 'stormy'
  @plane = plane
  puts @plane
  plane.landed?
end

def plane_depart
  fail "Unable to depart due to stormy conditions" if @weather == 'stormy'
  puts @plane
  @plane.departed?
end



end
