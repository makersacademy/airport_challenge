class Plane

  attr_reader :flying, :grounded

  def initialize
    @flying = true

  end

  def land
    @flying = false

  end
end
