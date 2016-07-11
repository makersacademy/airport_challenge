require_relative './airport'
class Plane
  def landed?
    @landed = true
  end
  def report_departed
    @departed = true
  end
  def departed?
    @departed
  end
end
