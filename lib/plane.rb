class Plane
  attr_reader :status, :seats

  def initialize
    @status = "airborne"
    @seats = []
  end

  def report_landing
    @status = "landed"
  end

  def report_take_off
    @status = "airborne"
  end

  def load(passenger)
    seats << passenger
  end



  private
  def airborne?
    true if status == "airborne"
  end

  def landed?
    true if status == "landed"
  end

end
