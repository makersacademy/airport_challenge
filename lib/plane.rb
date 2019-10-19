class Plane

  def initialize
    @status
  end

  def landed
    @status = "landed"
    "The plane has safely landed"
  end

  def taken_off
    @status = "flying"
    "The plane is in the air"
  end

  def flying?
    @status
  end

end
