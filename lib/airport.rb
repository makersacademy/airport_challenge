require_relative 'weather'
require_relative 'plane'

class Airport

  def initialize (capacity = 10)
    @parked = []
    @capacity = capacity
  end

  def land(plane)
    if @parked.length >= @capacity
      "Please wait we are at max capacity"
    elsif weather == 'stormy'
      'You may not land as weather is stormy'
    else
      @parked.push(plane)
      "Please land"
    end
  end

  def take_off(plane)
    @parked.pop
  end

end

