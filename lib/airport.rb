require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 10  
  attr_reader :planes_in_airport
  attr_reader

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_airport = []
  end

  def land(plane)
    weather_check
    raise "This plane is already in the airport." if @planes_in_airport.include?(plane)
    airport_full?
    @planes_in_airport << plane
  end

  def take_off(plane)
    weather_check
    raise "This plane is not in the airport." unless @planes_in_airport.include?(plane)
    @planes_in_airport.delete(plane)
    "#{plane} has successfully taken_off from #{self}."
  end

  def weather_check
    raise "Cannot enable take-off / landing during stormy weather" if weather
  end

 private

  def weather
    return false unless rand(1..50) == 50
    true
  end

  def airport_full?
    raise "Airport full, landing not possible." if @capacity == @planes_in_airport.count
  end

end
