class Plane
  attr_reader :serial_number

  def initialize(make = "Unknown", serial_number = "Unknown")
    @location = "Unknown"
    @make = make
    @serial_number = serial_number
  end

  def airborne?
    return @location == "Sky"
  end

  def change_location(new_location)
    @location = new_location
  end  

  def registration
    return { make: @make, serial: @serial_number }
  end
end
