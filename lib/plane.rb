class Plane

  attr_reader :status

  def initialize
    @status = true
  end

  def landed
    @status = false
  end

  def taken_off
    @status = true
  end
  
end
