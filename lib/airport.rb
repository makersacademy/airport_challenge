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
  end
end

# def airport
#   @airport
# end
