class Airport
  attr_reader :planes

  def initialize
  @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    raise "There are no planes to take off" if @planes.empty?
    @planes.pop
  end

end
