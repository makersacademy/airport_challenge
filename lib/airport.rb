require_relative 'plane'

class Airport

  attr_reader :airfield

  def initialize
    @airfield  = []
  end

  def land(plane)
    plane.land
    @airfield << plane
  end

  def confirm_landing(plane)
    airfield.include?(plane) ? true : false
  end

end
