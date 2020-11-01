require 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def landing(plane)
    @hangar << plane
  end

  def take_off(plane)
    hangar.delete(plane)
  end
end
