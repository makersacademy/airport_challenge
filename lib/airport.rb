class Airport
  attr_reader :planes, :capacity

  def initialize(cap = 10)
    @capacity = cap
    @planes = Array.new
  end

  def land_plane(plane_id)
    raise("Airport at maximum capacity") if @planes.count == @capacity

    @planes.push(plane_id)
  end

  def dispatch_plane(plane_id)
    raise("Airport empty") if @planes.empty?
    @planes.delete(plane_id)
    return plane_id
  end
end
