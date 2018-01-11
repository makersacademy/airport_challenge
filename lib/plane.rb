class Plane

  attr_reader :status

  def initialize
    @status = true
  end

  def landed
    @status = false
  end

  def took_off
    @status = true
  end

end
