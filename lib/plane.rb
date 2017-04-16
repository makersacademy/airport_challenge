class Plane
  
  attr_accessor :location
  
  def initialize
    @location = location
  end

  def land (airport)
    @location = airport
  end

end