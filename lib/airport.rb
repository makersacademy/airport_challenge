require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 2

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY )
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Landing denied, Airport is full" if full?
    fail "Landing denied, weather report stormy" if stormy?
    puts "Fasten seatbelts, plane landing..."
    planes << plane
  end

  def takeoff(plane)
    fail "the plane has already departed" if empty?
    fail "Take off denied, weather report stormy" if stormy?
    puts "Fasten seatbelts, plane taking off..."
    planes.pop
  end

  def plane_status
    puts "Number of Planes: #{planes}, #{planes.count} total."
  end

  private

    attr_reader :planes, :weather

    def empty?
      planes.empty?
    end

    def full?
      planes.length >= capacity
    end

    def stormy?
      rand(1..6) > 4
    end
end
