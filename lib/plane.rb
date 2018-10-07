class Plane
  def initialize(location = "land")
    @status = location
  end

  def status?
    @status
  end

  def update_status(status)
    @status = status
  end
end
