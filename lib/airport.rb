require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def permission_to_land(plane)
    hangar << plane
  end
end
