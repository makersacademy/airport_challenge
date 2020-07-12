class Plane

  attr_reader :flying

  def initialize
    @flying = true

  end

  def arrive
    @flying = false
  end

  def depart
    @flying = true
  end
end
