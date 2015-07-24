class Plane

  def initialize
    @status = :flying
  end

  def landed?
    true if @status == :landed
  end

  def land
    @status = :landed
  end
end
