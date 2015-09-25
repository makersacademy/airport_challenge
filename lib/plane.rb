class Plane

  attr_accessor :status

  def initialize
    @status= true
  end

  def flying?
    status
  end

  def land
    @status=false
  end

  def landed?
    !flying?
  end

  def take_off
    @status=true
  end

end
