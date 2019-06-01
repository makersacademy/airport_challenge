class Airport
  attr_reader :landed_planes, :weather

  def initialize(weather, landed_planes = [])
    @landed_planes = landed_planes
    @weather = weather
  end

  def land(plane)
    case @weather
    when :stormy
      raise "denied due to weather"
    else
      @landed_planes << plane
    end
  end

  def take_off(plane)
    case @weather
    when :stormy
      raise "denied due to weather"
    else
      @landed_planes.delete(plane)
    end
  end
end
