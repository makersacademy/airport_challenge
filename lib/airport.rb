class Airport
  attr_accessor :capacity, :planes

  def initialize capacity = 1
    @capacity = capacity >= 0 ? capacity : 1
    @planes = []
  end

  def clear_landing(plane) end
  def clear_takeoff(plane) end
end