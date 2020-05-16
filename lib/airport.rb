require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 2

  attr_accessor :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @capacity = cap
    @planes = []
  end

  def landing_ok?(plane)
    if @planes.length < @capacity
      landing(plane)
      true
    else
      puts "#{self} is full"
      false
    end
  end

  def takeoff_ok?(plane)
    departing(plane)
  end

  def landing(plane)
    @planes << plane
  end

  def departing(plane)
    @planes.delete(plane)
  end
end
