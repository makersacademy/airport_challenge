class Plane
  attr_reader :status

  def initialize
    @status = :airborne
  end

  def report_landing
    self.status = :landed
  end

  def report_take_off
    self.status = :airborne
  end

private
  attr_writer :status
end
