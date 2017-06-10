

# SPP: understands how to land and take off aircraft

# Do you need some way to start with planes?

class Airport

require_relative "weather"
require_relative "plane"

DEFAULT_CAPACITY = 20

def initialize(options={}, weather = Weather.new)
  @capacity = options[:capacity] || DEFAULT_CAPACITY
  @weather = weather
  @hanger = []
end

private

def is_full?
  hanger.size == capacity
end

def check_airspace_for(aircraft)
  fail "The plane is not flying" unless aircraft.flying?
end

def check_hanger_for(aircraft)
  fail "The plane is not here" unless hanger.include?(aircraft)
end

def check_capacity
  fail "There's no space to land here." if is_full?
end

def check_weather
   fail "It's too stormy" if weather.stormy?
end

def prepare_for_landing(aircraft)
  check_weather
  check_airspace_for(aircraft)
  check_capacity
end

def prepare_for_takeoff(aircraft)
  check_weather
  check_hanger_for(aircraft)
end

def dock(aircraft)
  hanger << aircraft
end

def dedock(aircraft)
  hanger.delete(aircraft)
end

attr_reader :capacity, :weather

public

attr_reader :hanger

def land(aircraft)
  prepare_for_landing(aircraft)
  aircraft.land
  dock(aircraft)
end

def takeoff(aircraft)
  prepare_for_takeoff(aircraft)
  dedock(aircraft)
  aircraft.fly
end


end
