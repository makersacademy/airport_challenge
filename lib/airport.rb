class Airport
attr_accessor :planes

  def initialize
    @planes = []
  end


  def instruct_plane_to_land(plane)
    @planes << plane
  end

  def instruct_plane_to_take_off(plane)
    @planes.delete(plane)
  end

  def plane_count
    @planes.count
  end
end
