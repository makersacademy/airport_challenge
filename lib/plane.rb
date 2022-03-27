class Plane
  attr_reader :serial_number
  attr_writer :location

  def initialize(make = "Unknown", serial_number = "Unknown")
    @location = "Unknown"
    @make = make
    @serial_number = serial_number
  end

  def airborne?
    @location == "Sky"
  end

  def registration
    { make: @make, serial: @serial_number }
  end
end
