# helper methods for Airport and AirTrafficControl test suites
def land_one
  subject.request_landing(plane)
end

def fill_her_up
  50.times { land_one }
end

def let_there_be_sun
  allow(subject).to receive(:weather) { :sunny }
end

def make_it_rain
  allow(subject).to receive(:weather) { :stormy }
end

# helper methods for Plane test suite
def land_self
  subject.land(airport)
end

def self_take_off
  subject.take_off(airport)
end
