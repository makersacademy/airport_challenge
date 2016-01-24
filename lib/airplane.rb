
class Airplane
  attr_reader :landed, :plane, :location

  DEFAULT_CAPACITY = 100

  def initialize
    @capacity = DEFAULT_CAPACITY
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
