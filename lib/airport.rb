class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    return false if @planes.length == @capacity
    @planes << plane
    true
  end

  def take_off(plane_taking_off)
    return false unless @planes.include? plane_taking_off
    @planes.delete(plane_taking_off)
    true
  end

  def plane_status(plane)
    gone = "plane not at airport"
    here = "plane still at airport"
    return here if @planes.include? plane
    gone
  end

end
