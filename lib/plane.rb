class Plane
  attr_accessor :status

  def initialize
    @status = "landed"
  end

  def fly
    self.status = "flying"
  end

  def land
    self.status = "landed"
  end

  def flying?
    status == "flying"
  end

  def landed?
    status == "landed"
  end

end
