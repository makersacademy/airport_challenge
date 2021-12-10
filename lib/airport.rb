class Airport
  def initialize
    @capacity = 5
  end

  def land_plane
    if @capacity.positive?
      @capacity -= 1
      "Plane successfully landed!"
    else
      "Sorry, airport is full!"
    end
  end

  def take_off
    "Plane successfully took off!"
  end
end
