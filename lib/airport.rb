require_relative 'plane'

class Airport
  attr_reader :planes
  attr_reader :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def receive_plane(plane)
    fail 'Airport full' if full?
      @planes << plane
      plane.successful_landing(self)
  end

  def release_plane(plane)
    @planes = @planes.select { |pl| pl != plane }
    plane.successful_takeoff
  end

  def plane_at_airport(plane)
    @planes.include? plane
  end

  def full?
    @planes.count >= @capacity
  end

end
