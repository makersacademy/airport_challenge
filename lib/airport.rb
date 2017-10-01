

class Airport
  attr_accessor   :plane
  # attr_writer  :plane
  attr_accessor :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @pln
    @capacity = capacity
  end

  def land_plane(plane)
    raise 'unable to land due to weather' if @weather == 'stormy'
    @plane = plane
    true
  end

  def takeoff_plane
    raise 'unable to takeoff due to weather' if @weather == 'stormy'
    @plane = nil
    true
  end

  def weather(weather)
    @weather = weather
  end

  def full?

  end

end
