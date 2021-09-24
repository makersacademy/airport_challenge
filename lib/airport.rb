class Airport
  attr_reader :capacity
  attr_reader :landed_planes

  def initialize(capacity)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    if @landed_planes.length >= capacity
      raise "Airport full!"
    elsif !plane.flying
      raise "Plane is already landed"
    else
      @landed_planes << plane 
      plane.flying = false
    end
  end
end


# if plane.flying
#   @landed_planes << plane 
#   plane.flying = false
# elsif @landed_planes.length == capacity
#   raise "Airport full!"
# else
#   raise "Plane is already landed"
# end