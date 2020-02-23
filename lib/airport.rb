require_relative 'plane'

# DEFAULT_CAPACITY = 10

class Airport
  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "There is no space!" if full?
    @planes << plane
  end

  def plane_count
    @planes.count
  end

  def take_off(plane)
  raise "There are no planes!" if empty?
    @planes.delete(plane)
  end

  private

  def full?
    if @planes.count >= 10
      return true
    end
  end

  def empty?
    if @planes.count == 0
      return true
    end
  end

end
