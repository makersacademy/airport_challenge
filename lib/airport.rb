require_relative "plane"

class Airport

  attr_reader :airport

  def initialize
    @airport = []
  end

  def land(plane)
    raise "There are no flying planes" if plane.flying? == false
      plane.state = false
      @airport << plane
      # plane.state = false
  end

  # def airport
  #   @airport
  # end

  def take_off
    raise "There are no planes available" if @airport.empty?
    plane = @airport.pop
    plane.state = true
    "The plane #{plane} has left the airport"
  end
end
