require 'plane'

class Airport
  def initialize(capacity = DEFAULT_CAPACITY)
    @airport_capacity = capacity
    @planes = []
  end

  DEFAULT_CAPACITY = 10
  
  attr_reader :airport_capacity

  def request_to_land(plane)
    if full?
      "Plane cannot land, Airport is full."
    else
      @planes << plane
      "Plane has landed."
    end
  end

  def request_to_take_off(_plane)
    "Plane has taken off."
  end

  private

  def full?
    @planes.count >= @airport_capacity
  end
end

#
# x = Airport.new
# puts x.request_to_land("plane")
