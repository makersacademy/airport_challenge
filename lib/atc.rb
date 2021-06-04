
# My attempt at the ATC solo challenge

class ATC

  attr_accessor :airport

  def new_aircraft(name)
    @id = name
  end

  def land_plane
    @ground = true
    return :landed, @ground
  end

  def takeoff
    @ground = false
    return :takenoff, @ground
  end
end

class Airport
  @size = 10
  def custom_size(size)
    @size = size
    return @size
  end
end
