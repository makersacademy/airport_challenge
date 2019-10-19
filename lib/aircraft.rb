class Aircraft
  DEFAULT_STATUS = "landed"
  DEFAULT_AIRPORT = "none"

  def initialize(status = DEFAULT_STATUS, airport = DEFAULT_AIRPORT)
    @status = status
    @airport = airport
  end

  def land_aircraft(airport_code)
    return fail "aircraft landed - cannot land again"\
     unless @status == "in flight"

    @status = "landed"
    @airport = airport_code
    return true
  end
end
