require 'plane'

class Airport
  attr_reader :@airport_gates, :capacity

  def initialize(capacity = 20)
    @airport_gates = []
    @capacity = capacity
  end


  def land_plane
    @airport_gates.push
  end

  def plane_take_off
    @airport_gates.shift

  end
end
