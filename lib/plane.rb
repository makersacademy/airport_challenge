class Plane

  attr_reader :location

  LOCATION = :air

  def initialize
    @location = :default_location 
  end

  def plane
  end

  def takeoff
    raise StandardError, "Plane is in the air" if @location == LOCATION
    
    @location = LOCATION
  end
end
