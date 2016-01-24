class Plane
  attr_reader :name, :in_air, :location
  def initialize(name="Plane1")
    @name = name
  end

  def in_air(in_air=false)
    @in_air = in_air
  end

  def set_location(location)
    @location = location
  end
end
