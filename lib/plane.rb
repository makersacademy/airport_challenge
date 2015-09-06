

class Plane

  def initialize
    @status = :flying
  end

  def get_status
    @status
  end

  def land
    @status = :landed
  end

  def take_off
    @status = :flying
  end


end
