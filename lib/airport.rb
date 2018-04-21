require_relative './plane'

class Airport

DEFAULT_CAPACITY = 20

attr_reader :planes

def initialize
  @planes = []
end

  def land_plane(plane)
    fail 'airport is full' if full?
    @planes << plane
  end

  def plane_depart
    fail 'airport is empty' if empty?
      @planes.pop
  end

private

  def empty?
    @planes.empty?
  end

  def full?
    planes.count >= DEFAULT_CAPACITY
  end
end
