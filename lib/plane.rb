class Plane
  attr_reader :status

  def initialize
    @status = ""
  end

  def fly
    @status = "flying"
  end

  def landed
    @status = "landed"
  end

end
