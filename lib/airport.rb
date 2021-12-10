require_relative './plane'

class Airport

  attr_reader :plane

  def initialize(capacity = 5)
    @capacity = capacity
    @planes_landed = []
  end

  def new_capacity(nr_planes)
    @capacity = nr_planes
    @capacity
  end

  def land(plane)
    fail "Can't land, Airport is at full capacity" if full?
    @planes_landed << plane
    plane
  end

  def take_off(plane)
    @planes_landed.pop
    puts "#{plane} has took off"
    plane
  end

  private

  def full?
    @planes_landed.size >= @capacity
  end
  
  def empty?
    @planes_landed.empty?
  end

end