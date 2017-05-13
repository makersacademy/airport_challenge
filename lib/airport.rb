class Airport
  attr_reader :landed_planes, :weather

  def initialize
    @landed_planes = []
  end

  def instruct_to_land(plane)
    @landed_planes << plane
    plane.update_location_after_landing(self.object_id)
    puts plane.report_landed
    self
  end

  def instruct_to_take_off(plane)
    @landed_planes.delete(plane)
    plane.update_location_after_take_off
    puts plane.report_take_off
    self
  end

end
