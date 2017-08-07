class Airport

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise 'Stormy weather' if weather.stormy?
    fail 'Unable to land, airport is full' if full?
    add_to_roster(plane)
    plane.land(self)
  end

  def take_off(plane)
    raise 'Stormy weather' if weather.stormy?
    fail 'Plane is not in this airport' unless here?(plane)
    plane.take_off(self)
  end

  def remove_from_roster(plane)
    planes.delete plane
  end

  def add_to_roster(plane)
    planes << plane
  end

  def full?
    planes.count >= capacity
  end

  def here?(plane)
    planes.include?(plane)
  end

  private
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 2

end
