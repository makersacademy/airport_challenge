require 'weatherservice'

class Airport

attr_reader :capacity

def initialize(weatherservice=Weatherservice.new)
  @apron = []
  @capacity = 20
  @weatherservice = weatherservice
end

def land(plane)
  fail "Weather is stormy" if @weatherservice.weather == "stormy"
  fail "Airport is full" if full?
  @apron << plane
  plane.land!
end

def apron
  @apron
end

def take_off(plane)
  fail "Plane not on apron" if !@apron.include? plane
  fail "Weather is stormy" if @weatherservice.weather == "stormy"
  plane.airborne = true
end

def full?
  @apron.count >= capacity
end


end
