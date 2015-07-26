class Plane
  attr_reader :status

  def initialize
    @status = "flying"
  end

  def landing
    raise "Plane is on the ground, sir." unless @status == "flying"
    @status = "landed"
  end

  def taking_off
    raise "Plane is in the air, sir." unless @status == "landed"
    @status = "flying"
  end

end