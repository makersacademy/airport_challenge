require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :capacity
  attr_reader :plane
  attr_accessor :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landed = []
    @weather = rand(1..2)

  end

  def take_off(plane)
    fail 'Cannot take off in stormy weather' if @weather == 2
    fail 'There are no planes in the airport' if @landed == []

    @landed.pop
    plane.in_airport = false
    return plane
  end

  def land(plane)
    fail 'Cannot land in stormy weather' if @weather == 2
    fail 'Airport is full' if @landed.count >= capacity
    fail 'That plane is already in the airport' if two_planes(plane)

    plane.in_airport = true
    @landed << plane
    return @landed
  end

  def two_planes(plane)
    return @landed.include?(plane)
  end

end
