class Plane
  attr_reader :landing, :taking_off

  def landing
    @landing = true
  end

  def taking_off
    @taking_off = false
  end

end