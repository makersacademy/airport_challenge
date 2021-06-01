class Plane
  attr_reader :status

  def status
    @status
  end

  def taking_off
    @status = 'taken off'
  end

  def landed
    @status = 'landed'
  end
end
