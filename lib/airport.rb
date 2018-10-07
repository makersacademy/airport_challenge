class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :landed_planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def hangar_report
    "Planes currently in the hangar: #{@landed_planes}"
  end
end
