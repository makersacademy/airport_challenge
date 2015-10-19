class Plane

  attr_reader :status

  def initialize
    @status = :landed
  end

  def lands
    @status = :landed
  end

  def takes_off
     @status = :flying
  end

end
