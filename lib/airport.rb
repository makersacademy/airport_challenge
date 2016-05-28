require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def confirm_landed(plane)
    if at_airport?(plane)
      "#{plane} has landed at airport"
    else
      "#{plane} has not landed at airport"
    end
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def take_off(plane)
    @planes.pop
    @planes
  end

  def confirm_departed(plane)
    if at_airport?(plane)
      "#{plane} has not departed airport"
    else
      "#{plane} has departed airport"
    end
  end

end