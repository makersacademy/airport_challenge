class Airport
  attr_reader :landed_planes, :weather

  def initialize
    @landed_planes = []
    @weather = Weather.new
  end

  def instruct_to_land(plane)
    @landed_planes << plane
    plane.update_location_after_landing_to(self)
    puts plane.report_landed
    self
  end

  def instruct_to_take_off(plane)
    @landed_planes.delete(plane)
    plane.update_location_after_take_off_from(self)
    puts plane.report_take_off
    self
  end

end
