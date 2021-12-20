class Airport
  
  attr_reader :docked_planes
  DEFAULT_CAPACITY = 20

  def initialize
    @docked_planes = []
  end
  
  def full?
    @docked_planes.count >= DEFAULT_CAPACITY
  end

end