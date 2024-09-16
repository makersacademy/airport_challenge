require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize
    @terminal = []
  end

  def land(plane)
    @terminal << plane
  end
  
  def take_off
    true
  end

  def full
    DEFAULT_CAPACITY 
  end

  # def terminal(plane)
  #   @terminal << plane
  #   # DEFAULT_CAPACITY
  # end
end
