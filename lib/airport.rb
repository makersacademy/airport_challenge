
class Airport

  attr_reader :planes

  def initialize
  @planes = [] # we could use @planes.delete("planename")
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
    return @planes
  end

end
