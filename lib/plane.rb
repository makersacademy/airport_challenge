class Plane
  attr_reader :status

  def initialize
    @status = :flying
  end

  def lands
    @status = :parked
  end

  def takes_off
    @status = :flying
  end
end
