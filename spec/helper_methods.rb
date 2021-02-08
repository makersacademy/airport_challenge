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

def let_there_be_sun
  make_it(:sunny)
end

def make_it_rain
  make_it(:stormy)
end

# helper methods for Feature Tests and Airport / AirTrafficControl
def make_it(weather)
  allow_any_instance_of(Airport).to receive(:weather_forcast) { weather }
end

def land_plane(airport)
  new_plane.land(airport)
end

# helper methods for Airport and AirTrafficControl test suites
def land_one
  subject.request_landing(plane)
end

def fill_it_up
  50.times { land_one }
end

# helper methods for Plane test suite
def land_self
  subject.land(airport)
end

def self_take_off
  subject.take_off(airport)
end
