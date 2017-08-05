class Airport

  attr_accessor :planes, :capacity

  def initialize(capacity = 2)
    @planes ||= []
    @capacity = capacity
  end

  def open?
    true
  end

  def land(plane)
    raise "Airport is full!" if full?
    @planes << plane
    p "You have #{@planes.count} planes in the airport"
  end

  def take_off(plane)
    # raise "Cannot take off" if stormy?
    @planes.delete(plane)
    p "You have #{@planes.count} planes in the airport"
  end

private

  def full?
    @planes.count >= @capacity
  end

end
