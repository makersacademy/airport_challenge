class Plane

  def initialize
    @status = :flying
  end

  def status= (status)
    @status = status
  end

  def flying?
    @status == :flying
  end

  def landed?
    @status.class == Airport
  end

  def land (airport)
    # the plane isn't already landed, fail if so
    fail 'Already landed!' if landed?
    # order the airport to accept the plane, change plane condition according to response
    result = airport.land(self)
    if result.class == Airport
      @status = result
    end
    result
  end

  def launch
    # I'm duplicating pointers to keep references in both directions. Is this wise?
    # Also, yeah, the flying thing
    fail 'Already flying!' if flying?
    # Order the airport to release the airplane, it returns true or stormy or no such plane
    result = @status.launch self
    if result
      @status = :flying
    end
    result
  end

end
