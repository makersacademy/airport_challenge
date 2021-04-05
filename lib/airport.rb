require_relative 'plane'

class Airport
  attr_accessor :hangar, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Error: Cannot land plane, hangar is full' if full?
    raise 'Error: Cannot land plane, weather is stormy' if stormy?

    @hangar << plane
  end

  def take_off(plane)
    
  end

  private

  def full?
    @hangar.length >= @capacity
  end

  def empty?
    
  end

  def stormy?
    weather = rand(1..6)
      if weather < 3
        return true
      else 
        return false
      end
  end

end
