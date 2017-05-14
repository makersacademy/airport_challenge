class Airport
  attr_reader :landed_planes, :weather, :capacity
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def instruct_to_land(plane)
    fail "The weather is stormy. Landing not allowed." unless weather.safe?
    fail "This airport is full. Wait until another plane has taken off." if full?
    @landed_planes << plane
    plane.update_location_after_landing_to(self)
    puts plane.report_landed
    self
  end

  def instruct_to_take_off(plane)
    fail "The weather is stormy. Take off not allowed." unless weather.safe?
    @landed_planes.delete(plane)
    plane.update_location_after_take_off_from(self)
    puts plane.report_take_off
    self
  end

  def full?
    if capacity <= landed_planes.length
      return true
    else
      return false
    end
  end

end
