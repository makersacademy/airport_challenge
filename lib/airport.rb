class Airport
  def initialize
    @capacity = 5
    @planes_number = 0
  end

  attr_writer :capacity

  def land_plane
    if @planes_number < @capacity
      @planes_number += 1
      "Plane successfully landed!"
    else
      "Sorry, airport is full!"
    end
  end

  def take_off
    "Plane successfully took off!"
  end
end
