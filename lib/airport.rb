class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_held = []
  end

  def land(plane)
    if full?
      :cannot_land_plane
    else
      @planes_held << plane
      :successful
    end
  end

  def takeoff(plane)
    :successful
  end

  def full?
    @planes_held.length >= @capacity
  end

end
