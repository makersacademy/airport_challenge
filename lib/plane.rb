class Plane

  def initialize
    @status = "stationed"
  end

  def stationed?
    @status == "stationed"
  end

  def take_off
    @status = "in the air"
  end

end
