class Plane

  attr_reader :status

  def initialize
    @status = :landed
  end

  def land
    raise 'Plane is already on the ground' if landed?

    @status = :landed
  end

  def takeoff
    raise 'Plane is already airborne' if airborne?

    @status = :airborne
  end

  private

  def landed?
    @status == :landed
  end

  def airborne?
    @status == :airborne
  end
end