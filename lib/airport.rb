class Airport

  def initialize(name, capacity, landed_planes)
    @name = name
    @capacity = capacity
    @landed_planes = landed_planes
  end

  attr_accessor :landed_planes
  attr_reader :name, :capacity

  def landing_possibility?
    @capacity > @landed_planes
  end

end
