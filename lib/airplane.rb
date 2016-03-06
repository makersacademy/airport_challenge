class Plane

  attr_reader :current_status, :flight_num

  def initialize(flight_num)
    @current_status = nil
    @flight_num = flight_num
  end

  def land
    @current_status = :landed
  end

  def takeoff
    @current_status = :inflight
  end

end
