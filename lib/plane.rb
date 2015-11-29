class Plane

  attr_reader :status, :location

  def initialize
    @status = "flying"
    @location = "in-air"
  end

  def flying?
    @status == "flying"
  end

  def land(airport)
    @status = "not-flying"
    @location = airport
  end

  def take_off
    @status = "flying"
    @location = "in-air"
  end

  private

  attr_writer :status, :location

end