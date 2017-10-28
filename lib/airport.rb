class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "plane already in airport" if present?(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "plane not in airport" unless present?(plane)
    @planes.delete(plane)
  end

  private

  def present?(plane)
    @planes.include?(plane)
  end
end
