class Airport

  def initialize(capacity)
    @capacity = capacity
    @landed_planes = 0
  end

  def land(plane)
    raise 'Landing denied: airport full' if @landed_planes >= @capacity
    @landed_planes += 1

  end

  def take_off
  end
end
