
class Airport

  attr_accessor :full, :capacity
  attr_reader :planes
  attr_writer :weather_is_stormy

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather_is_stormy = false
    @full = false
    @capacity = capacity
  end

  def weather_is_stormy?
    num = rand(1..7)
    @weather_is_stormy = true if num > 5
    @weather_is_stormy = false
  end

  def add_plane(plane)
    raise "Plane can not land due to stormy weather" if @weather_is_stormy
    raise "Plane can not land because the airport is full" if self.is_full?
    @planes << plane
  end

  def remove_plane(plane)
    raise "Plane can not take off due to stormy weather" if @weather_is_stormy
    @planes.delete(plane)
    @full = false if @planes.count < @capacity
  end

  def is_full?
    return true if @planes.count >= @capacity
    false
  end

end
