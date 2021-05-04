require_relative 'weather.rb'

class Airport

  DEF_CAPACITY = 10
  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity=DEF_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def takeoff(plane)
    fail "No planes to take off" if airportempty?
    @planes.pop
  end

  def land(plane)
    fail "Can't land, airport full" if airportfull?
    @planes << plane
  end

end

private

def airportfull?
  @planes.count >= capacity
end

def airportempty?
  @planes.empty?
end
