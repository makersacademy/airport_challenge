class Plane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def stop_flying
    @flying = false
  end

  def start_flying
    @flying = true
  end
end
