class Plane
  attr_reader :status

  def initialize
    @status = :flying
  end

  def land
    @status = :landed
    self
  end

  def take_off
    @status = :flying
    self
  end
end