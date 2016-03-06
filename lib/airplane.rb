class Plane

  def initialize
    @current_status = nil
  end

  def current_status
    @current_status
  end

  def land
    @current_status = :landed
  end

  def takeoff
    @current_status = :inflight
  end

end
