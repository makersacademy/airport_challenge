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
    @airport.pop #if !@airport.empty?
  end

end
