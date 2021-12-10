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
    if @planes_number.positive?
      @planes_number -= 1
      "Plane successfully took off!"
    else
      "There are no airplanes to take off!"
    end
  end
end
