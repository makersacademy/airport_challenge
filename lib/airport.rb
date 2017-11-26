require './lib/plane.rb'
class Airport
  attr_reader :capacity
  attr_reader :planes_at_airport
  attr_reader :weather

  def initialize(capacity = 3)
    @capacity = capacity
    @planes_at_airport = []
    @weather = ['Sunny', 'Snow', 'Stormy'].sample
  end

  def land_plane(plane)
    raise('Cannot land weather is Stormy') if stormy?
    @planes_at_airport.push(plane)
    @planes_at_airport
  end

  def take_off(plane)
    raise('Cannot take off weather is Stormy') if stormy?
    @planes_at_airport.delete(plane)
    @planes_at_airport.last
    @planes_at_airport
  end

  def stormy?
    @weather == 'Stormy'
  end
  
end
