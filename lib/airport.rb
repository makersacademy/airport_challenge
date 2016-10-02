require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    
  end





end
