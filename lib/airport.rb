class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Airport full." if full?
    @planes << plane        
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= 20
  end
end