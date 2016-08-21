class Plane


  def report_landed
    @landed = true
  end

  def report_take_off
    fail "Same plane cannot take off" if @landed == false
    @landed = false
  end

  def landed?
    @landed
  end


end
