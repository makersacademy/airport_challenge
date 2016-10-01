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
      plane.landed
      register_airport(plane)
  end

  def release_plane(plane)
    @planes = @planes.select { |pl| pl != plane }
    register_airport(plane)
  end

  def register_airport(plane)
    if plane.landed
      plane.set_airport(self)
    else
      plane.set_airport('')
    end
  end

  def plane_at_airport(plane)
    @planes.include? plane
  end

  def full?
    @planes.count >= @capacity
  end

end
