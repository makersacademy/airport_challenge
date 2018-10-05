class Airport
  attr_reader :landed_planes

  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
    "#{plane} landed successfully."
  end

  def take_off(plane)
    raise "Specified plane is not in the airport!" unless @landed_planes.include? plane
    @landed_planes.delete(plane)
    "#{plane} taken off successfully."
  end

  def hangar_report
    "Planes currently in the airport: #{@landed_planes}"
  end

  private

  attr_reader :landed_planes
end
