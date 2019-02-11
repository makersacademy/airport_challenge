class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity

  end

  def land(plane)
    raise 'Cannot land, its stormy' if stormy?
    raise 'Cannot land, airport full' if full?
    @planes << plane

  end

  def take_off(plane)
    puts "No more planes in the airport"
    raise 'Cannot take off, its stormy' if stormy?
  end

  private
  def stormy?
    true
  end
  def full?
    @planes.length >= @capacity
  end
end
