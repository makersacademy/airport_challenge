class Plane
  def initialize
    @status = "air"
  end

  def status?
    @status
  end

  def set_status(status)
    @status = status
  end
end
