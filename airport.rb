class Airport
  attr_reader :planes
  attr_accessor :capacity
  def initialize(capacity: DEFAULT_CAPACITY, weather: weather.new)
    @capacity = capacity
    @weather = weather
    @planes = Array.new
  end
  def land_plane(plane)

  end
  def takeoff_plane(plane)

  end
  private
  DEFAULT_CAPACITY = 4
end