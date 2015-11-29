class Plane

  def initialize
    @status = :flying
  end

  def land
    fail "This plane is already landed" if landed?
    @status = :landed
  end

  def take_off
    fail "This plane is already flying" if flying?
    @status = :flying
  end

  private

  attr_reader :status

  def landed?
    status == :landed
  end

  def flying?
    status == :flying
  end

end
