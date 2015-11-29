class Plane

  attr_reader :status

  def initialize
    @status
  end

  def land
    @status = :landed
  end

  def take_off
    @status = :taken_off
  end
end
