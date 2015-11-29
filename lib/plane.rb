class Plane

  attr_reader :status

  def initialize
    @status = :flying
  end

  def land
    fail "This plane is already landed" if landed?
    @status = :landed
  end

  def take_off
  end

  private

  def landed?
    status == :landed
  end

end
