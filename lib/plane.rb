class Plane
  def initialize
    @status = "flying"
  end

  def status
    @status
  end

  def landing
    @status = "landed"
  end

  def take_off
    @status = "flying"
  end
end
