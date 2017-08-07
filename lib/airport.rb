class Airport

  attr_accessor  :planes, :capacity, :weather
  DEFAULT_CAPACITY = 100

  def initialize (planes = 50, capacity = DEFAULT_CAPACITY)
    @planes = planes
    @capacity = capacity
  end

  def receive_plane
    @planes += 1
  end

  def remove_plane
    @planes -= 1
  end

  def get_weather
    rand(9) == 0 ? :stormy : :sunny
  end

  def full?
    @planes == @capacity
  end

end
