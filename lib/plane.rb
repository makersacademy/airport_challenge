class Plane
  attr_reader :status

  def initialize
    @status = "flying"
  end

  def landing
    @status = "landed"
  end

  def taking_off
    @status = "flying"
  end

end