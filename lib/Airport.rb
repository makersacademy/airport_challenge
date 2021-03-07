class Airport
  CAPACITY = 3
  attr_accessor :plane

  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail 'Airport is full' if full?

    @planes << plane
    @planes.last
  end

  def take_off
    fail 'That plane is not here' if empty?

    @planes.pop
  end

private
  def full?
    if @planes.length >= CAPACITY
      true
    else
      false
    end
  end

  def empty?
    if @planes.length == 0
      true
    else false
    end
  end
end
