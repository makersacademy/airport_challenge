class Plane

  attr_reader :in_hangar, :location, :flight_number

  def initialize
    @flight_number = namegen
    @in_hangar = false
    @location = "the plane factory"
  end

  def move_to_hangar(location)
    @in_hangar = true
    @location = location
    self
  end

  def fly
    @in_hangar = false
    @location = "the sky"
    self
  end

  private

  @@plane_number = 0

  def namegen
    @@plane_number += 1
    "MA#{@@plane_number}"
  end

end
