require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    hangar << plane
  end

  def take_off
    hangar.pop
  end

  def in_airport?(plane)
    hangar.include?(plane)
  end

end

# def hangar
#   @hangar
# end
