class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def instruct_to_land(plane)
    @landed_planes << plane
    plane.update_location(self.object_id)
    self
  end

end
