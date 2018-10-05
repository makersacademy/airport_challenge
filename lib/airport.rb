class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    raise "Stormy weather, cannot land." if weather == "stormy"
    @landed_planes << plane
  end

  def take_off(plane)
    raise "Plane is not in the airport!" unless @landed_planes.include? plane
    raise "Stormy weather, cannot take off." if weather == "stormy"
    @landed_planes.delete(plane)
  end

  def hangar_report
    "Planes currently in the airport: #{@landed_planes}"
  end

  private

  def weather
  end
end
