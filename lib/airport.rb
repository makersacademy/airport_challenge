class Airport
  DEFAULT_CAPACITY = 20
  STORM_CHANCE = 0.05

  attr_reader :landed_planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full!" if @landed_planes.count >= DEFAULT_CAPACITY
    raise "Plane already in the airport." if @landed_planes.include? plane
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

  def weather
    rand < STORM_CHANCE ? "stormy" : "sunny"
  end
end
