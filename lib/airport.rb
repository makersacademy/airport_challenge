
class Airport
   attr_reader :planes, :capacity

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    fail "Full Airport. Keep flying!" if @planes.length >= @capacity
    @planes << plane
  end

  def take_off(plane)
    fail "There are no planes!" unless @planes.include?(plane)
    @planes.delete(plane)
  end


private
CAPACITY = 50

end
