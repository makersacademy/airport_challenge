require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 10  
   attr_reader :planes_in_airport
   attr_accessor :weather_check

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_airport = []
  end

  def land(plane)
    weather_check
    raise "This plane is already in the airport." if @planes_in_airport.include?(plane)
    raise "Airport full, landing not possible." if @capacity == @planes_in_airport.count
    @planes_in_airport << plane
  end

  def take_off(plane)
    weather_check
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

end
