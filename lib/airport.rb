require_relative 'plane'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = Array.new
  end

  def land(plane)
    # not passing SRP atm
    raise "Airport has reached capacity: Cannot land plane" if @planes.size == @capacity
    @planes.push(plane)
  end

  def take_off
    # not passing SRP atm
    raise "There are no planes in the airport!" if @planes.size == 0
    raise "It is unsafe to take off due to stormy conditions" if weather? == 'stormy'
    plane = @planes.pop
    "#{plane} is no longer in the airport"
  end

  def weather?
    return 'stormy' if rand(10) > 8
    'sunny'
  end

end
