require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize
    @bay = []
  end

  def bay_count
    "There are #{@bay.length} planes currently in the bay"
  end

  def stormy?
    number = rand(1..10)
    number > 8 ? true : false
  end

  def land(plane)
    @plane = plane
    weather = self.stormy?
    if weather == true
      fail "Cannot land in STORMY weather"
    elsif @bay.length >= DEFAULT_CAPACITY
      fail "Cannot land when airport is full"
    else
      @bay << @plane
      "#{@plane} has landed at the airport"
    end
  end

  def take_off
    weather = self.stormy?
    if weather == true
      fail "Cannot take off in STORMY weather"
    elsif @plane == nil
      fail "There are no planes in the airport"
    else
      "#{@plane} has left the airport"
    end
  end

end
