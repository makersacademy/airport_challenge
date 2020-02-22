class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = Array.new
    @capacity = capacity
  end

  def land(plane)
    fail "No spaces are available for landing" if @planes.length >= @capacity
    @planes << plane
  end

  def take_off(plane)
    if @planes.length.positive?
      @planes.pop
      "Plane took off"
    else
      fail "There are no planes to take off"
    end    
  end
  
  private
  def stormy?
    rand(6) == 5
  end
end

class Plane
end
