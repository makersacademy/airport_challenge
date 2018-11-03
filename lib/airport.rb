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
    confirm_take_off(plane)
  end

  def confirm_take_off(plane)
    "#{plane} has taken off!" if !@hangar.include?(plane) 
  end

end
