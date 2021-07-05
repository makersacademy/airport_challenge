class Plane
  attr_reader :departed

  def initialize
    @departed = false
  end

  def departed?
    @departed
  end

  def arrive
    @departed = false
  end

  def depart
    @departed = true
  end
end
