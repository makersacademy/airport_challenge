
# My attempt at the ATC solo challenge

class ATC

  attr_accessor :airport

  def initialize(size)
    @airport_cap = size
    @aircraft_grounded = 0
  end

  def land_plane
    if @aircraft_grounded >= @airport_cap
      return false
    else
      @aircraft_grounded += 1
      @ground = true
      return :landed, @ground
    end
  end

  def takeoff
    if @aircraft_grounded >= 0
      @aircraft_grounded -= 1
      @ground = false
      return :takenoff, @ground
    end
  end
end

class Airport
  @size = 10
  def custom_size(size)
    @size = size
    return @size
  end
end
