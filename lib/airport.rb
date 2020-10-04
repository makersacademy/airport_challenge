class Airport
  AIRPORT_CAPACITY = 3
  def initialize(name, capacity = AIRPORT_CAPACITY)
    @hangar = []
    @name = name
    @capacity = capacity
  end

  def land(plane)
    raise "You can't land. #{@name}'s hangar is full." unless @hangar.length < @capacity

    @hangar << plane
  end

  def depart(plane)
    @hangar.delete(plane)
    "Plane #{plane} has left #{@name}"
  end
end
