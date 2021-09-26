class Plane
  attr_reader :plane, :current_airport, :in_flight
  def initialize
    @in_flight = false
    @current_airport = nil
  end

  def land(airport)
    raise "This airport is full" unless airport.landed_planes.count < airport.capacity
    raise "You are already landed" unless @in_flight
    @in_flight = false
    @current_airport = airport
    airport.landed_planes << self
  end

  def take_off(airport = @current_airport)
    raise "You are already in flight" unless !@in_flight
    raise "You cannot take off in stormy weather" unless airport.weather != :stormy
    @in_flight = true
    @current_airport = nil
    airport.landed_planes.delete(self)
  end
end
