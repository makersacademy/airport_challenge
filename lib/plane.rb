class Plane
  DEFAULT_STATUS = 'flying'

  def initialize(status = DEFAULT_STATUS)
    @status = status
  end

  def landed?
    @status == 'landed'
  end

  def landed
    @status = 'landed'
  end

  def left_airport
    @status = 'flying'
  end

end
