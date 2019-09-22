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
    number > 8
  end

  def land(plane)
    @plane = plane
    weather = stormy?
    fail "Cannot land in STORMY weather" if weather == true

    fail "Cannot land when airport is full" if @bay.length >= DEFAULT_CAPACITY

    @bay << @plane
    "#{@plane} has landed at the airport"
  end

  def take_off
    weather = stormy?
    fail "Cannot take off in STORMY weather" if weather == true
    
    fail "There are no planes in the airport" if @bay.length.zero?

    plane = @bay.sample
    @bay.delete(plane)
    "#{plane} has left the airport"
  end

end
