class Airplane
  attr_reader :landed, :plane, :location

  def initialize
    @landed = true
    @location = nil
  end

  def report_landed(airport)
    @landed = true
    @location = airport
  end

  def report_inflight
    @landed = false
    @location = nil
  end

end
