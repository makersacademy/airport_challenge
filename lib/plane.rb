class Plane

attr_reader :airport

  def report_landed(parent_airport)
    fail "landed plane already" if @landed == true
    @landed = true
    @airport = parent_airport
  end

  def report_take_off
    fail "Same plane cannot take off" if @landed == false
    #ßfail "Not in this airport" if parent_airport
    @landed = false
  end

  def landed?
    @landed
  end


end
