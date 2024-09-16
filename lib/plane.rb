class Plane
  attr_reader :flight_status

  def initialize
    @flight_status = false
  end

  def take_off
    @flight_status = true
  end

  def land
    @flight_status = false
  end

end
