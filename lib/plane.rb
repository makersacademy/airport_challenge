class Plane

  attr_reader :landed

  def initialize
    @landed = false
    @taken_off = false
  end

  def landed?
    @landed
  end

  def report_landing
    @landed = true
  end

  def report_take_off
    @taken_off = true
  end

  def taken_off?
    @taken_off
  end

end
