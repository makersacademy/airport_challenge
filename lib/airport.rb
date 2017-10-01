

class Airport
  attr_accessor   :plane
  # attr_writer  :plane
  attr_accessor :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise 'unable to land due to weather' if @weather == :stormy
    raise 'no space to land' if full?
    @planes << plane
    true
  end

  def takeoff_plane
    raise 'unable to takeoff due to weather' if @weather == :stormy
    @planes.pop
  end

  def weather(weather)
    @weather = weather
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end

  def capacity
    @capacity
  end
end
