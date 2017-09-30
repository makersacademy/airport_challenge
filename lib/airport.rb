class Airport

  attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport is full!' if @planes.count == 20
    @planes << plane
    plane
  end

  def take_off
    fail 'There are no planes!' if @planes.empty?
    @planes.pop
  end

end
