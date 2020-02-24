class Plane
  attr_accessor :status

  def land
    fail "We have a plane" if landed?
    @status = :landed
  end

  def landed?
    @status = :landed
  end

  def take_off
    fail "Shes gone boss" if flying?
    @status = :flying
  end

  def flying?
    @status = :flying
  end

end