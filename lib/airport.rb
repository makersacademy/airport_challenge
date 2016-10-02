class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: weather is stormy' if stormy?
    @planes.push(plane)
  end

  def take_off(plane)
    raise 'Cannot take off plane: weather is stormy' if stormy?
    @planes.delete(plane)
  end

  private

  def stormy?
    rand(1..6) > 4
  end
end
