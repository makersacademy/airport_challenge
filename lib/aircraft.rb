class Aircraft
  DEFAULT_STATUS="landed"

def initialize(status=DEFAULT_STATUS)
  @status=status
end

  def land_aircraft
  return false unless @status == "in flight"
    return true
  end
end
