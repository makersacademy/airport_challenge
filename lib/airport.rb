require_relative 'passenger'
require_relative 'plane'

class Airport

  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @people = []
    50.times { @people << Passenger.new }
    @planes = [Plane.new]
    @capacity = capacity
  end

  DEFAULT_CAPACITY = 5

  def full?
    @planes.length == @capacity ? true : false
  end

  def land(plane)
    fail 'No space for plane to land!' if full?
    @planes << plane
    #set plane.landed? to true
  end

  def takeoff(plane)
    fail 'Plane is not available' if @planes.!include? plane
    @planes.delete(plane)
    #set plane.landed? to false
  end

end
