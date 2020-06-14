require_relative 'plane'

class Airport
  attr_reader :plane

  def initialize
    @plane = []
    @@hangar = []
  end

  def land(plane)
    fail "No hangar space available" if hangar_full(plane)
    @@hangar << plane
    @plane = plane
  end

  def takeoff(plane)
    @@hangar.pop
  end

  private

  def hangar_full(plane)
      @@hangar.include?(plane)
  end

end