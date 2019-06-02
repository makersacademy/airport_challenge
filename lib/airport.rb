class Airport
  attr_reader :landed_planes, :weather, :capacity

  def initialize(weather: :sunny, capacity: 4, landed_planes: [])
    @landed_planes = landed_planes
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    if @weather == :stormy
      weather_error
    elsif @capacity == @landed_planes.count
      raise "denied: airport is full"
    else
      @landed_planes << plane
    end
  end

  def take_off(plane)
    case @weather
    when :stormy
      weather_error
    else
      @landed_planes.delete(plane)
    end
  end

  def weather_error
    raise "denied due to weather"
  end
end
