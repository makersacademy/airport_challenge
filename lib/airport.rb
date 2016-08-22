require_relative "plane"
require_relative "weather"

class Airport

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @in_airport = []
  end

  attr_reader :in_airport, :capacity

  def request_land(aircraft, weather)
    Weather.new
    conditions(weather)
    fail "Plane already landed" if @in_airport.include?(aircraft)
    fail "Airport full" if full?
    aircraft.land
    @in_airport << aircraft
    puts "Landed safely" if @in_airport.include?(aircraft)
  end

  def request_depart(aircraft, weather)
    Weather.new
    conditions(weather)
    fail "Plane already in flight" unless @in_airport.include?(aircraft)
    aircraft.take_off
    @in_airport.delete(aircraft)
    puts "aircraft departed" unless @in_airport.include?(aircraft)
    aircraft
  end

  private

  def conditions(weather)
    fail "its to dangerous to do that now" if weather.stormy?
  end

  def full?
    @in_airport.count >= @capacity
  end

end
