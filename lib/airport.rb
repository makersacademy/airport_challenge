require_relative 'plane'

class Airport
  attr_reader :landed_planes, :capacity

  def initialize
    @landed_planes = []
    @capacity = 20
  end

  def land_plane(plane)
    fail "Maintain holding pattern" if holding_pattern?
    plane.land
    @landed_planes << plane
    @landed_planes
  end

  def clear_plane(plane)
    plane.take_off
    @landed_planes.delete(plane)
    @landed_planes
  end

  def override_capacity(new_capacity)
    @capacity = new_capacity
  end

  private
    def holding_pattern?
      weather = 'fair'
      @landed_planes.count >= @capacity || weather == 'stormy'
    end

end
