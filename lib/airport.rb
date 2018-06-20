class Airport
  def initialize
    @number_of_planes = 0
  end

  def can_land?
    true
  end

  def can_takeoff?
    true
  end

  def landing plane
    @number_of_planes += 1
  end
  
end
