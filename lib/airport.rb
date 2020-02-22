class Airport

  DEFAULT_VALUE = 5
  attr_accessor :capacity
  attr_accessor :stormy

  def initialize(capacity = DEFAULT_VALUE)
    @capacity = capacity
    @no_of_planes = 0
    @stormy = stormy
  end

# lands planes
  def land(*)
    fail "The airport is full" if @capacity == @no_of_planes

    stops_planes

    @no_of_planes += 1
  end

# lets planes take off
  def take_off(*)
    fail "Bad weather, no taking off" if @stormy == true

    @no_of_planes -= 1
  end

# checks to see if there are planes in the airport
  def empty?
    true
  end

# finds out if it is stormy
  def it_stormy?
    @stormy = rand(3) == 1
  end

# stops planes from taking off in bad weather
  def stops_planes
    fail "Bad weather, no landing" if @stormy == true
  end
end
