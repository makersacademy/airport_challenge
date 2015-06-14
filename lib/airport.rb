require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
  end

  def take_off
    fail "There are no planes to take off" if empty?
    planes.pop
  end

  def land_plane plane
    fail "Airport is full" if full?
    fail "This plane isn't flying" if plane.landed?
    plane.land
    planes << plane
  end

  def current_number_of_planes
    planes.count
  end


  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

end