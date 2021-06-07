
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

  # instead of an array have a set value and then plus and minus
  # when aircraft takes off or lands 

  def airport_size
    test = []
    p test.length
    test.length > 10
  end
end

test = Airport.new
p test.airport_size
