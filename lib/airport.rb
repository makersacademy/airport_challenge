class Airport
  attr_accessor :capacity, :planes, :weather

  def initialize capacity = 1
    @capacity = capacity >= 0 ? capacity : 1
    @planes = []
    @weather = :sunny
  end

  def clear_for_landing(plane) end
  def clear_for_takeoff(plane) end
end