class Plane

  def initialize
    @status = :flying
  end

  def landed
    fail "This plane is already landed" if landed?
    @status = :landed
  end

  def took_off
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
