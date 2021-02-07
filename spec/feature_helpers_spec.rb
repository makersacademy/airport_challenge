# helper methods for feature_spec.rb
def new_airport
  Airport.new
end

def new_plane
  Plane.new
end

def new_weather
  Weather.new
end

def make_sunshine
  make(:sunny)
end

def why_does_it_always_rain_on_me
  make(:stormy)
end

def make(weather)
  allow_any_instance_of(Airport).to receive(:weather_forcast) { weather }
end

def land_plane(airport)
  new_plane.land(airport)
end
