class Airport
  WEATHER_CONDITIONS = Array.new(30, "sunny") << "stormy"

  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    raise "Plane already in the airport." if @landed_planes.include? plane
    raise "Stormy weather, cannot land." if check_weather == "stormy"
    @landed_planes << plane
  end

  def take_off(plane)
    raise "Plane is not in the airport!" unless @landed_planes.include? plane
    raise "Stormy weather, cannot take off." if check_weather == "stormy"
    @landed_planes.delete(plane)
  end

  def hangar_report
    "Planes currently in the airport: #{@landed_planes}"
  end

  def check_weather
    WEATHER_CONDITIONS.sample
  end
end
