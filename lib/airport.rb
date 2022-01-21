require_relative "plane"

class Airport
  MAX_CAPACITY = 10
  # STORMY_WEATHER = false

  attr_reader :planes
  attr_reader :capacity

  attr_accessor :capacity

  def initialize(capacity=MAX_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "Airport full" if full?
    puts "The plane is landed!"
    planes << plane
  end

  def takeoff_plane
    puts "The plane has taken off!"
    planes.pop
  end

  private

  def full?
    planes.count >= capacity
  end
end