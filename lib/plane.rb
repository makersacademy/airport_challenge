class Plane
  attr_accessor :status

  def initialize
    @status = :flying
  end

  def landed?
    true if status == :landed
  end

  def land
    @status = :landed
  end
end
