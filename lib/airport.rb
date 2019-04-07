require_relative 'plane'

class Airport
  attr_reader :airport_capacity

  def initialize
    @airport_capacity = []
  end

  def land_plane(plane)
    plane
  end

  def take_off(plane)
    plane
  end

end
