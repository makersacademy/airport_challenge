require './lib/plane.rb'

class Airport

  attr_reader :airport

  def initialize
    @airport = []
  end

  def land(plane)
    raise "The airport is full and can't land anymore planes" if @airport.length >= 20
    @airport << plane
  end

  def take_off(plane)
      @airport.delete(plane)
      puts "Confirmation the plane has left the airport"
  end

end
