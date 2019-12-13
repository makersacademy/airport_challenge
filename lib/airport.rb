class Airport
  def land_plane(plane_id)
    raise("Airport at maximum capacity") if @plane
    
    @plane = plane_id
  end

  def dispatch_plane
    @plane
  end
end
