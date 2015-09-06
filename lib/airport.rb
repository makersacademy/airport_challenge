class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity, :planes, :allow_landing, :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @allow_landing = true
    @weather = Weather.new
  end

  def allow_landing?
    return false if weather.stormy?
    allow_landing
  end

  def allow_take_off?
    return false if weather.stormy?
    true
  end


  def receive_plane(plane)
    planes << plane if allow_landing?
    @allow_landing = false if full?
  end

  def release_plane(plane)
    fail 'Plane not at this airport' unless planes.include?(plane)
    return unless allow_take_off?
    while planes.last != plane
      planes.rotate!
    end
    @allow_landing = true
    planes.pop
  end

  private

  def full?
    return true if planes.count == capacity
    false
  end

end
