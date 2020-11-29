require_relative './plane.rb'

class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full?

    puts "Plane landed"
    @hangar << plane
  end

  def take_off(plane)
    fail "Plane not at this airport" unless present?(plane)

    puts "Plane departed"
    @hangar.delete(plane)
  end

  def full?
    @hangar.size >= @capacity
  end

  def present?(plane)
    @hangar.include?(plane)
  end

end
