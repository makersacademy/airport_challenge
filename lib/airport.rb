class Airport
  attr_reader :planes

  def initialize(capacity)
    @planes = []
  end

  def land(plane)
    raise 'Airport is full!' if @planes.count == 10
    @planes << plane
  end

  def take_off
    @planes.pop
  end

end
