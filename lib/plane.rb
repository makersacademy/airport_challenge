class Plane
  attr_reader :status
  def initialize
    @status = :airborne
  end

  def land
    raise 'This plane has already landed!' if status == :landed
    @status = :landed
  end

  def take_off
    raise 'This plane is no longer in the airport!' if status == :airborne
    @status = :airborne
  end

end
