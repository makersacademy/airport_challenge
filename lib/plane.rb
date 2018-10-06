class Plane
  def initialize
    @status = "air"
  end

  def status?
    @status
  end

  def update_status(status)
    @status = status
  end
end
