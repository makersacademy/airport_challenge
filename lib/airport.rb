require_relative 'weather'
require_relative 'plane'

class Airport

  def initialize(capacity = 10)
    @parked = []
    @capacity = capacity
  end

  def land(plane)
    if @parked.length >= @capacity
      "Please wait we are at max capacity"
    elsif weather == 'stormy'
      'You may not land as weather is stormy'
    # elsif @parked.each { |planes| 
    #   planes == plane }
    #   "This plane has already landed"
    else
      @parked.push(plane)
      "Please land"
    end
  end

  def take_off(plane)
    if weather == 'stormy'
      'You may not take off, the weather is too stormy'
    elsif @parked.each { |planes| 
      planes != plane 
    }
      "This plane is not parked at this airport"
    else
      @parked.pop
      "Happy flighting"
    end
  end
end
