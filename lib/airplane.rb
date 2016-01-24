
class Airplane
  attr_reader :landed, :plane, :location
  def initialize
    @landed = true
  end

  def report_landed(airport)
    @landed = true
    @location = airport
  end

  def report_inflight
    @landed = false
  end

end
