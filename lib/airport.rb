class Airport
  CAPACITY = 20
  attr_writer :plane
  attr_reader :planes

  def initialize
    # all airports start with an abilty to hold a plane
    # even if it's just crashing them into the ground
    # and a brand new airport that has not had a plane land
    # would have a size of zero
    @planes = Array.new(0)
  end

  def takeoff_plane
    fail 'No plane to takeoff' if @planes.empty?
    @planes.pop
  end

  def land_plane plane
    fail 'Airport Full' if @planes.length >= CAPACITY
    @planes << plane
  end

  def atc
  end

  def capcity
    CAPACITY
  end

  def num_planes
    @planes.length
  end
end
