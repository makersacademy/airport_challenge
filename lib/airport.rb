require_relative 'plane'

class Airport

attr_reader :plane, :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    plane
    hangar.push(plane)
  end

  def take_off(plane)
    
  end
end