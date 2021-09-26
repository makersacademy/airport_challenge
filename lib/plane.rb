class Plane
  attr_reader :plane, :in_flight
  attr_accessor :current_airport
  def initialize
    @in_flight = false
    @current_airport = nil
  end

  def land(airport)
    raise "This airport is full" unless airport.landed_planes.count < airport.capacity
    raise "You are already landed" unless @in_flight
    raise "You cannot land in stormy weather" unless !airport.stormy_weather
    @in_flight = false
    @current_airport = airport
    airport.landed_planes << self
  end

  def take_off(airport = @current_airport)
    raise "You are already in flight" unless !@in_flight
    raise "You cannot take off in stormy weather" unless !airport.stormy_weather
    raise "You cannot take off from an airport you are not at" unless airport == current_airport
    @in_flight = true
    @current_airport = nil
    airport.landed_planes.delete(self)
  end
end
