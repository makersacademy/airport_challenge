class Plane

  def initialize
    @status = :flying
  end

  def status=(status)
    @status = status
  end

  def flying?
    @status == :flying
  end

  def landed?
    # This originally checked if @status.class was an airport, but I
    # removed that as it messed up doubling of methods etc.
    @status != :flying
  end

  def land(airport)
    # the plane isn't already landed, fail if so
    fail 'Already landed!' if landed?
    # order airport to accept the plane, change plane condition to response
    result = airport.land(self)
    # This is ugly. I'm assuming failed landing with go straight past
    # so the only time the following is invoked is when the plane lands
    @status = result
    result
  end

  def launch
    # Fail if the plane's already in the air
    fail 'Already flying!' if flying?
    # Order airport to release plane, fails if not launched, otherwise
    # returns the plane object
    result = @status.launch self
    if result
      @status = :flying
    end
    result
  end

end
