require './lib/plane.rb'

class Airport

  attr_reader :airport

  def initialize
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def take_off(plane)
      @airport.delete(plane)
      puts "Confirmation the plane has left the airport"
  end

end
