require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 2

  attr_accessor :capacity

  def initialize(cap = DEFAULT_CAPACITY)
    @capacity = cap
    @planes = []
  end

  def landing_ok?
    if @planes.length < @capacity
      true
    else
      puts "#{self} is full"
      false
    end
  end

  def landing(plane)
    @planes << plane
  end
end
