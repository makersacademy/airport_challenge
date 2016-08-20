class Plane

  def report_landed
    @landed = true
  end

  def report_take_off
    @landed = false
  end

  def landed?
    @landed
  end


end
