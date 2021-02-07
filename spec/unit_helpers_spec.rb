# helper methods for Airport and AirTrafficControl test suites
def land_one
  subject.request_landing(plane)
end

def fill_her_up
  50.times { land_one }
end

def let_there_be_sun
  make_it(:sunny)
end

def make_it_rain
  make_it(:stormy)
end

def make_it(weather)
  allow(subject).to receive(:weather_forcast) { weather }
end

# helper methods for Plane test suite
def land_self
  subject.land(airport)
end

def self_take_off
  subject.take_off(airport)
end
