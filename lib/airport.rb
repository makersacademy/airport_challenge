class Airport
  attr_reader :planes

  def initialize
    @planes = Array.new
  end

  def land_plane(plane_id)
    raise("Airport at maximum capacity") if @planes.count == 1

    @planes.push(plane_id)
  end

  def dispatch_plane
    raise("Airport empty") if @planes.empty?
    @planes.pop
  end
end
