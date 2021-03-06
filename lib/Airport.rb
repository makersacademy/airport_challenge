require_relative 'plane'
class Airport
  CAPACITY = 3
attr_accessor :plane

  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail 'Airport is full' if self.full?
    @planes << plane
    @planes.last
  end

  def take_off
    fail 'That plane is not here' if self.empty?
    @planes.pop
  end
end

  # def full?
  #   true
  # end
private
  def full?
    if @planes.length >= 3
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

class Plane
  def present?
      false
  end
end
