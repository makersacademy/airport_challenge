class Plane
  attr_reader :location
  
  def initialize
    @location = :air
  end

  def ground
    @location = :ground
  end

  def air
    @location = :air
  end
  
end
