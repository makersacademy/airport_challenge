class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :plane, :planes, :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @planes = []
    @capacity = cap
  end

  def land(plane)
    raise 'Plane already landed' if plane.landed
    raise 'Airport at capacity' if full?
    if safe_to_fly
      plane.land
      @planes << plane
      return plane
    end
    raise 'Not safe to land'
  end

  def takeoff
    raise 'No planes available' if empty?
    takeoff = @planes[0]
    if safe_to_fly
      @planes.delete_at(0)
      takeoff.takeoff
      return takeoff
    end
    raise 'Not safe to fly'
  end

  def check_weather(weather)
    @weather = weather.now
  end

  private

  def full?
    @planes.length == @capacity
  end

  def empty?
    @planes.empty?
  end

  def safe_to_fly
    @weather != :stormy
  end
end
