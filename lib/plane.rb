class Plane
  attr_reader :plane, :current_airport, :in_flight

  def initialize
    @in_flight = nil
    @current_airport = ""
  end

  def land(airport)
    raise "This airport is full" unless airport.landed_planes.count < airport.capacity
    @in_flight = false
    @current_airport = airport
  end

  def take_off
    @in_flight = true
    @current_airport = nil
  end
end