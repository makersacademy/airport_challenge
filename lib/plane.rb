class Plane

  attr_accessor :location

  def initialize(location = "Factory")
    @location = location
  end

  def fly
    @location = "Sky"
  end

  def arrive(airport)
    @location = airport
  end

end
