class Plane

  attr_reader :current_status

  def initialize
    @current_status = nil
  end

  def land
    @current_status = :landed
  end

  def takeoff
    @current_status = :inflight
  end

end
