require_relative 'plane.rb'

class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :plane
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airport = []
  end

  def take_off
    if empty?
      raise "No planes available"
    else
      @airport[0]
    end
  end

  def land_plane(plane)
    if full?
      raise "Airport full"
    else
      @airport
      "Plane landed"
    end
  end

  private
  def full?
    @airport.count >= DEFAULT_CAPACITY
  end
  def empty?
    @airport.empty?
  end

end
