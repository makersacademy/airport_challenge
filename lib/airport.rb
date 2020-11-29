require_relative './plane.rb'

class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if @hangar.size >= @capacity

    @hangar << plane
  end

  def take_off(*)
    @hangar = nil
    puts "Plane has left airport"
  end
end
