class Plane
  attr_reader :flying, :status

  def initialize
    @flying = false
    @status = :flying
  end

  def fly
    @flying = true
    @status = :flying
  end

  def land
    @flying = false
    @status = :landed
  end
end
