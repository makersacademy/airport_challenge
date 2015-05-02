require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 6

  attr_accessor :capacity

  # def initialize capacity=6
    @capacity = DEFAULT_CAPACITY
    @hangar = []
  end

  def release_plane
    fail 'Airport empty' if empty?
    @hangar.pop
  end

  def land_plane
    fail 'Airport full' if full?
    @hangar = plane
  end
end


private

  attr_reader :hangar

  def full?
  @hangar.count >= :capacity
  end

  def empty?
  @hangar.empty?
  end

end