class Plane

  attr_accessor :flight_status

  def initialize(flight_status = :flying)
    @flight_status = flight_status
  end

  def flying?
    @flight_status == :flying
  end

  def landed?
    @flight_status == :landed
  end

  def taken_off?
    @flight_status == :taken_off
  end

end
