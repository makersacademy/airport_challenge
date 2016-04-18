class Plane

attr_reader :status

  def initialize(status=:flying)
    @status = status
  end

  def flying
    raise "is already flying" if @status == :flying
    @status = :flying
  end

  def landed
    raise "has landed already" if @status == :landed
    @status = :landed
  end

  

end