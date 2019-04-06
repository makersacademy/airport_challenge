class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def recieve_plane(plane)
    fail "airport is full" if full?

    @planes << plane
  end

  def release_plane
    fail "airport is empty" if empty?

    @planes.pop
  end
end

private

CAPACITY = 20

def full?
  @planes.count >= CAPACITY
end

def empty?
  @planes.count < 1
end

# def initialize
#   @bikes = []
# end
#
# def release_bike
#   fail 'No bikes available' if empty?
#   @bikes.pop
# end
#
# def dock(bike)
#   fail "docking station is full" if full?
#   @bikes << bike
# end
#
# private
#
# def full?
#   @bikes.count >= 20
# end
#
# def empty?
#   @bikes.empty?
# end
