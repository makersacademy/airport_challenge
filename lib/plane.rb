class Plane

  def initialize
    @taken_off = false
    @landed = false
  end

  def suitable_for_flying?
    true
  end

  def report_landed
    @landed = true
  end

  def landed?
    @landed
  end

  def report_takenoff
    @taken_off = true
  end

  def taken_off?
    @taken_off
  end

end
