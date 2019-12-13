class Airport

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
    @capacity = 20
  end

  def land(plane)
    if @landed_planes.count == @capacity
      raise("Landing not possible, the airport is at full capacity.")
    else
      @landed_planes.push(plane)
    end
  end

  def take_off(plane)
    @landed_planes.delete(plane)
  end
end
