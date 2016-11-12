class Plane

  attr_reader :landed

  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def report_landing
  end

  def report_take_off
  end

  def taken_off?
    true
  end

end
