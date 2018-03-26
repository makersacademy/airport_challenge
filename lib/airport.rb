class Airport
  attr_reader :plane

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Cannot land due to stormy weather" if @state == 10
    @plane = plane
    @planes.push(plane)
  end

  def takeoff
    fail "Cannot takeoff due to stormy weather" if @state == 10
    @plane
  end

  def weather
    @state = (1..10).rand
    return "stormy" if @state.rand == 10
  end
end
