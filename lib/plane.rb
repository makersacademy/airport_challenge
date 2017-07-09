class Plane

  attr_reader :flying
  alias flying? flying

  def initialize
    @flying = true
  end

  def start_flying
    @flying = true
  end

  def end_flying
    @flying = false
  end

end
