require './lib/plane.rb'
class Airport
  attr_reader :capacity
  attr_reader :planes_at_airport

  def initialize(capacity = 3)
    @capacity = capacity
    @planes_at_airport = []
  end

  def land_plane(plane)
    raise('Cannot land weather is Stormy') if stormy?
    raise('no more landing space') if airport_full?
    plane.landed?
    @planes_at_airport.push(plane)
  end

  def take_off(plane)
    raise('Cannot take off weather is Stormy') if stormy?
    plane.fly?
    @planes_at_airport.delete(plane)
  end

  def stormy?
    @stormy = weather
  end
  
  def weather
    ['Sunny', 'Rain', 'Snow', 'Stormy'] == 'Stormy' ? true : false
  end

  def airport_full?
    @planes_at_airport.length >= @capacity
  end 

end
