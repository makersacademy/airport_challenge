class Plane
  attr_reader :status

  def initialize
    @status = "flying"
  end

  def landing
    raise "You're already on the ground, sir." unless @status == "flying"
    @status = "landed"
  end

  def taking_off
    raise "You're already in the air, captain..." unless @status == "landed"
    @status = "flying"
  end

end