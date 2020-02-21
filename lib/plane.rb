require_relative 'airport'
class Plane
  def stops_flying
    @flying = false
  end

  def flying?
    @flying
  end
end
