class Plane

attr_reader :airport

  def report_landed(parent_airport)
    fail "Plane landed" if @landed == true
    @landed = true
    @airport = parent_airport
  end

  def report_take_off
    fail "Same plane cannot take off" if @landed == false
    @landed = false
  end

  def landed?
    @landed
  end


end
