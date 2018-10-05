class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
  end

  def take_off(plane)
    raise "Specified plane is not in the airport!" unless @landed_planes.include? plane
    @landed_planes.delete(plane)
  end

  def hangar_report
    "Planes currently in the airport: #{@landed_planes}"
  end
end
