require './lib/plane.rb'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :airport

  def initialize
    @airport = []
  end

  def land(plane)
    plane.flying = true
    if !airport_full? && plane.flying == true
      plane.grounded = true
      plane.flying = false
      @airport << plane
    else
      raise "The airport is full and can't land anymore planes"
    end
  end

  def take_off(plane)
    plane.grounded = true
    if !self.airport.empty? && plane.grounded == true
      plane.grounded = false
      plane.flying = true
      @airport.delete(plane)
      puts "The plane has left the airport"
    else
      raise "There are no planes at the airport to take off"
    end
  end
  
  def airport_full?
    @airport.length >= DEFAULT_CAPACITY ? true : false
  end


end


# ap = Airport.new
# plane1 = Plane.new
# p ap.land(plane1)
# p ap.take_off(plane1)