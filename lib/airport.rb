class Airport
  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
  end

  def hangar_report
    "Planes currently in the airport: #{@landed_planes}"
  end
end
