require_relative "plane"

class Airport
  attr_reader :capacity

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def request_landing(plane)
    fail "Airport is at capacity" if at_capacity?
    @planes << plane
  end

  private

  def at_capacity?
    @planes.length >= @capacity
  end
end

=begin

class Airport
  attr_reader :landed_planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def request_to_land(plane)
    fail "The airport is at capacity" if full?
    @landed_planes << plane
  end

  def take_off
    departing_plane = @landed_planes.pop
    departing_plane.take_off
    puts "The plane has departed"
  end

  private

  def full?
    @landed_planes.length >= @capacity
  end
end


=end
