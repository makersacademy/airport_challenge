class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def instruct_plane_to_land(plane, weather = Weather.new)
    # write exception for stormy and full?
    raise "Cannot land - severe weather warning!" if weather.stormy?

    raise "Cannot land - airport is full!" if full?

    @planes << plane
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  private
  def full?
    @planes.size == @capacity
  end
end
