class Airport

attr_reader :planes

  def land(plane)
    @planes << plane
  end

  def initialize(planes = [])
    @planes = planes
  end
end
