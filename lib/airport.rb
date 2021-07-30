class Airport
  attr_accessor :capacity, :planes, :weather

  def initialize capacity = 1
    @capacity = capacity >= 0 ? capacity : 1
    @planes = []
    @weather = :sunny
  end

  def clear_for_landing(plane)
    @planes << plane
  end

  def clear_for_takeoff(plane)
    @planes.delete plane
  end

  # def full?
  #   planes.size == @capacity
  # end
end