

class Plane

  def initialize
    @flying = false
  end

  def landing?
    @flying
  end

  def landed?
    !@flying
  end

  def departing?
    !@flying
  end

  def reported_flying
    @flying = true
  end

  def flying?
    @flying
  end

  def reported_bad_weather
    @flying = false
  end

end
