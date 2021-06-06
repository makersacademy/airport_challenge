require_relative 'plane'

class Airport

  attr_accessor :airport_capacity
  attr_reader :planes

  def initialize
    @planes = []
    @airport_capacity = 20
  end

  def stormy?
    rand(20) == 10
  end

  def land(plane)
    if stormy?
      "No landings while weather is stormy"
    elsif @planes.length < 20
      @planes << plane
    else
      "Sorry, airport's full!"
    end
  end

  def takeoff(plane)
    if stormy?
      "No takeoffs while weather is stormy"
    elsif @planes.include?(plane)
      @planes.delete(plane)
      "#{plane} has left the airport"
    else
      "Plane not at airport"
    end
  end
end
