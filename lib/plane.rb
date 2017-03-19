class Plane
  attr_reader :status

  def initialize
    @status = :airborne
  end

  def report_landing
    @status = :landed
  end

  def report_take_off
    @status = :airborne
  end

end
