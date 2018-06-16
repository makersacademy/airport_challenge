class Airport
  def initialize(capacity: 15, current_weather: :clear)
    @capacity = capacity
    @current_weather = current_weather
    @landed_planes = []
    # Set with occupation?
  end

  attr_reader :current_weather, :landed_planes
  def request_landing
    raise 'Weather prevents landing' if @current_weather == :stormy
    raise 'Plane cannot land in a full airport' if full?
    true
  end

  def request_takeoff
    raise 'Weather prevents takeoff' if @current_weather == :stormy
    true
  end

  def store_plane(plane)
    @landed_planes << plane
  end

  def remove_plane(plane)
  end

  def full?
    @landed_planes.size >= @capacity
  end
end
