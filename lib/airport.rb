class Airport
  attr_reader :landed_planes
  attr_reader :capacity
  attr_reader :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new, landed_planes = [])
    @capacity = capacity
    @landed_planes = landed_planes
    @weather = weather
  end

  def receive_plane(plane)
    if !full
      @landed_planes.push(plane)
      return true
    else
      return false
    end
  end

  def release_plane(plane)
    weather_conditions_good = !is_stormy
    @landed_planes.delete(plane) if weather_conditions_good
    return weather_conditions_good
  end

  def return_weather
    weather.report
  end

  def is_stormy
    return_weather == "stormy"
  end

  private

  def full
    @landed_planes.size >= @capacity
  end

end
