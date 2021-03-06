require 'plane'

class Airport
  def initialize
    @planes = nil
  end

  def request_to_land(plane)
    if full?
      "Plane cannot land, Airport is full."
    else
      @planes = plane
      "Plane has landed."
    end
  end

  def request_to_take_off(_plane)
    "Plane has taken off."
  end

  private

  def full?
    @planes != nil
  end
end

#
# x = Airport.new
# puts x.request_to_land("plane")
