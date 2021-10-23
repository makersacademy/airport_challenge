require_relative 'plane'

class Airport
  attr_accessor :planes, :capacity
  DEFAULT_CAPACITY = 80

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    weather
    fail "The airport is full!" if full?
    fail "Bad weather, can not land" if weather == "stormy"
    fail "This plane is already in the airport!" if @planes.include?(plane)

    @planes << plane
  end

  def take_off(plane)
    weather
    fail 'Bad weather, can not to take off' if weather == "stormy"
    fail "This plane is not in the airport!" unless @planes.include?(plane) 

    @planes.pop
  end

  def weather
    ["sunny", "stormy", "sunny", "sunny", "sunny"].sample
  end

  private

  def full?
    @planes.length >= @capacity
  end
end