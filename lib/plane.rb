require_relative 'airport'

class Plane
  def initialize(condition = false)
    @plane_status = condition
  end

  def flying?
    return @plane_status
  end

  def mark_as_landed
    @plane_status = false
  end

  def mark_as_flying
    @plane_status = true
  end
end
