require_relative 'plane'

class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end

  def land_at_airport(plane)
    @hangar << plane
  end

  def take_off_from_airport(plane)
    @hangar.delete(plane)
  end

  def confirm_take_off(plane)
    return "#{plane} has taken off!" unless @hangar.include?(plane)
    "#{plane} has not taken off yet!"
  end

end
