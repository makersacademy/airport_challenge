require_relative './airport'
class Plane
  attr_reader :departed
  def initialize
    @departed = departed
  end
  def report_departed
    @departed = true
  end
  def report_landed
    @departed = false
  end
  def departed?
    @departed
  end
end
