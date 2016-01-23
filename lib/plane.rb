class Plane

  def initialize
    @status = ""
  end

  def status
    @status
  end

  def fly
    @status = "flying"
  end

  def landed
    @status = "landed"
  end

end
