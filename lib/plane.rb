class Plane

  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def report_landed
    @landed = true
  end

  def report_taken_off
    @landed = false
  end

end
