class Aircraft
  attr_reader :registration
  attr_reader :status
  attr_reader :airport
  DEFAULT_STATUS = "landed"
  DEFAULT_AIRPORT = "none"
  DEFAULT_REGISTRATION = ""

  def initialize(status = DEFAULT_STATUS,\
     airport = DEFAULT_AIRPORT, registration = DEFAULT_REGISTRATION)
    @status = status
    @airport = airport
    @registration = registration
  end

  def land_aircraft(airport_code = "")
    return fail "aircraft landed - cannot land again"\
     unless @status == "in flight"

    return fail "need to specify airport to land"\
     unless airport_code != ""

    @status = "landed"
    @airport = airport_code
    return true
  end

  def takeoff(airport)
    return fail "Cannot takeoff from #{airport}. Currently at #{@airport}."\
    unless @airport == airport

    return fail "Already in flight. Cannot takeoff."\
    unless @status == "landed"

    @airport = ""
    @status = "in flight"
  end

end
