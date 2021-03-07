require 'airport'

class Plane
  attr_accessor :name, :airport, :country_takeoff

  def initialize(airport = nil, name = 'boeing747', country_takeoff = nil)
    @name = name
    @airport = airport
    @country_takeoff = country_takeoff
  end

  def land(airport)
    airport.arrive(self)
    @airport = airport
  end

  def take_off
    @airport.depart(self)
    @country_takeoff = @airport.country
    @airport = nil
  end

end
