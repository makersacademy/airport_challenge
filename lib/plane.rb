class Plane

  def initialize
    @status = {message: "Not in operation", airport: nil}
  end

  def take_off(airport)
    problems?("takeoff", airport)
    airport.remove(self)
    set_status("Has taken off", airport)
  end

  def land(airport)
    problems?("landing",airport)
    airport.add(self)
    set_status("Landed",airport)
  end

  def status
    if took_off?
      take_off_message_formatted
    elsif landed?
      landing_message_formatted
    else
      @status[:message]
    end
  end

  def landed?
    @status[:message] == "Landed"
  end

  def took_off?
    @status[:message] == "Has taken off"
  end

  def take_off_message_formatted
    @status[:message] + " from airport "+ @status[:airport].to_s
  end

  def landing_message_formatted
    @status[:message] + " at airport " + @status[:airport].to_s
  end

  def set_status(status, airport)
    @status = {message: status, airport: airport}
  end

  def problems?(action, airport)
    fail "Cannot complete: adverse weather" if airport.adverse_weather?
    if action == "landing"
      fail "Already landed... " + landing_message_formatted if landed?
      fail "Cannot land at a full airport" if airport.full?
    elsif action == "takeoff"
      fail "Already flying... " + take_off_message_formatted if took_off?
      fail "Cannot take off from an airport I'm not in" unless airport.planes.include?(self)
    end
  end

end
