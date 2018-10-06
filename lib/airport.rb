class Airport
  DEFAULT_CAPACITY = 20
  STORM_CHANCE = 0.05

  attr_reader :landed_planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def hangar_report
    "Planes currently in the airport: #{@landed_planes}"
  end

  def weather
    rand < STORM_CHANCE ? "stormy" : "sunny"
  end
end
