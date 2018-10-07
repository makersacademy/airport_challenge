class Plane

  attr_reader :location

  def initialize(location = "Factory")
    @location = location
  end

  def fly
    @location = "Sky"
    "Take off successful for #{self}"
  end

  def arrive(airport)
    @location = airport
    "#{self} arrived at #{airport}"
  end

end
