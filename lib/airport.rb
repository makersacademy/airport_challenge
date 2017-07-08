require_relative 'passenger'
require_relative 'plane'

class Airport

  attr_reader :capacity
  attr_reader :planes
  attr_reader :people

  def initialize(capacity = DEFAULT_CAPACITY)
    @people = []
    DEFAULT_PASSENGERS.times { @people << Passenger.new }
    puts "#{DEFAULT_PASSENGERS} passengers waiting at the airport"
    @planes = []
    @capacity = capacity
  end

  DEFAULT_PASSENGERS = 20
  DEFAULT_CAPACITY = 5

  def full?
    @planes.length == @capacity ? true : false
  end

  def land(plane)
    fail 'No space for plane to land!' if full?
    plane.land
    @planes << plane
  end

  def takeoff(plane)
    fail 'Plane is not available' if (@planes.include?(plane) == false)
    plane.takeoff
    @planes.delete(plane)
  end

  def board(plane)
    fail "#{plane} is not currently landed at this airport!" if (@planes.include?(plane) == false)
    (plane.space > @people.count ? @people.count : plane.space).times { plane.board(@people.pop) }
  end

  def alight(plane)
    fail "#{plane} is not currently landed at this airport!" if (@planes.include?(plane) == false)
    plane.people.count.times { @people << plane.alight }
  end
end
