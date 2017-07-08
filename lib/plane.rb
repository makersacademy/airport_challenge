class Plane
  attr_reader :status

  def initialize
    @status = nil
  end

  def landed
    @status = :landed
  end

  def flying
    @status = :flying
  end 
end
