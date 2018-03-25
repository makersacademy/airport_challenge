class Airport

  attr_accessor :ramp
  attr_reader :capacity
  attr_reader :name

  def initialize(capacity = 1, name = "gatwick")
    @capacity = capacity
    @name = name
    @ramp = []
  end

  def land(plane)
    @ramp << plane
  end

  def takeoff
    @ramp.pop
  end
end
