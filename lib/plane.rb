class Plane

  attr_reader :location
  attr_reader :status

  def initialize(location = "airport", status = "landed")
    @location = location
    @status = status
  end

  def take_off(airport)
    @location = "in the air"
    @status = "flying"
  end
end
