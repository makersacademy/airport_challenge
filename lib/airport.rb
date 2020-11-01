class Airport

  $DEFAULT_CAPACITY = 35

  attr_reader :landed_planes, :capacity

  def initialize(capacity = $DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
  end

  def inbound_flight(plane)
    raise Exception.new "Landing denied - Airport in full capacity" if @landed_planes.length == @capacity

    @landed_planes << plane
  end

  def outbound_flight(plane)
    @landed_planes.delete(plane)
  end

  def confirm_takeoff(plane)
    "Plane #{plane} is not at the airport." unless @landed_planes.include?(plane)
  end
end
