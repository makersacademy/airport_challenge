class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :landed_planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def hangar_report
    return "No planes currently in the airport." if landed_planes.count < 1
    "Planes currently in the hangar: #{landed_planes.join(", ")}"
  end
end
