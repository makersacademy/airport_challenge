class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'airport is full' if @planes.length >= 6
    @planes << plane
  end

  def take_off
  end
end
