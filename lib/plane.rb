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

  def take_off(airport=@current_airport)
    weather = airport.generate_weather
    raise "You are already in flight" unless @current_airport != nil
    if weather == :stormy
      raise "You cannot take off in stormy weather"
    elsif weather == :clear
      @in_flight = true
      @current_airport = nil
    end
  end
end
