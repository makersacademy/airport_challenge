require_relative 'weather'

class Plane

  attr_accessor :flying, :airport, :weather

  def initialize(airport=nil) #plane defaults to flying if airport not stated during initialisation
    @flying = airport == nil #sets @flying to result of comparison boolean
    @weather = Weather.new
  end

  def land(airport)
    fail "The weather is too bad to land." if @weather.stormy? #fail land if stormy
    fail "The hangar is full." if airport.full?
    airport.land(self) #ensures only the plane with the same class ID lands
    @flying = false #plane no longer flying
    @airport = airport #plane now in airport
  end

  def takeoff(airport)
    fail "The weather is too bad to takeoff." if @weather.stormy?
    fail "Plane is already flying" if @flying #fails if plane already flying or if not in hangar to takeoff
    airport.takeoff(self) #ensures only the plane with the same class ID takes off
    @flying = true #plane now flying
    @airport = nil #plane no longer in airport
  end

end
