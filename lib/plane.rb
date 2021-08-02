class Plane
  attr_accessor :location

  def initialize
    @location = :air
  end
  
  def grounded?
    @location != :air
  end

  def update_location(location)
    location == :air ? @location = :ground : @location = :air
  end
end
