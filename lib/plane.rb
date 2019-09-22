require_relative 'airport'


class Plane

  attr_accessor :flying, :landed

  def initialize
    @flying = false
    @landed = false
  end

  def report_flying
    @flying = true
  end

  def report_landed
    @landed = true
  end
end
