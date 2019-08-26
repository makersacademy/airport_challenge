require_relative 'airport'

class Plane

  def initialize(has_landed = false)
    @has_landed = has_landed
  end

  def land(airport, weather)
    
    fail 'Sorry - poor weather' unless weather.set_weather

    fail 'Sorry - full capacity' unless  
    airport.plane_array.count < airport.capacity

    fail 'Sorry - this plane has already landed' unless @has_landed == false

    @has_landed = true

    airport.plane_array.push(self)
  end

  attr_reader :has_landed
  attr_writer :has_landed

end
