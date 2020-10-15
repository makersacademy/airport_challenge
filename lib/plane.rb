class Plane
  attr_accessor :location 

  def initialize(location)
    @location = location
  end

  def takeoff
    @location = "flying" unless location == "flying"
  end

  def land(airport)
    @location = airport if @location == "flying"
  end
end
