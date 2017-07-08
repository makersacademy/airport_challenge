require_relative 'passenger'
require_relative 'plane'

class Airport

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @people = []
    50.times { @people << Passenger.new }
    @planes = [ Plane.new ]
    @capacity = capacity
  end

  DEFAULT_CAPACITY = 5

  def full?
    @planes.length == @capacity ? true : false
  end
end
