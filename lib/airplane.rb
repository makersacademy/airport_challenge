class Plane

  def initialize
    @current_status = :landed
  end

  def current_status
    @current_status
  end

  def land(plane)
    @current_status = :landed
  end

end
