require_relative 'weather'
require_relative 'plane'

class Airport

  def initialize (capacity = 10)
    @parked = []
    @capacity = capacity
  end

  def land(plane)
    @parked.push(plane)
  end

  def take_off(plane)
    @parked.pop
  end

  def at_capacity
    if @parked.length >= @capacity
      "Please wait we are at max capacity"
    else
      "Please land"
    end
  end



end

