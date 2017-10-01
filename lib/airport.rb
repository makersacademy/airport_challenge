class Airport
  attr_accessor :planes, :capacity

  def initialize
    @planes = []
    @capacity = 5
  end

  def instruct_plane_to_land(plane)
    raise "plane cannot land because the airport is full" if @planes.count >= @capacity
    raise "plane cannot land in stormy weather" if stormy?
    @planes << plane
  end

  def instruct_plane_to_take_off(plane)
    raise "plane cannot take off in stormy weather" if stormy?
    @planes.delete(plane)
  end

  def plane_count
    @planes.count
  end

  def stormy?
    rand(1..100) > 70
  end
end
