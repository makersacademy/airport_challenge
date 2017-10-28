class Plane
  attr_reader :status

  def initialize
    @status = 'grounded'
  end

  def grounded?
    @status == 'grounded'
  end

  def flying?
    @status == 'flying'
  end

  def land
    fail 'Plane Already Grounded' if grounded?
    @status = 'grounded'
  end

  def take_off
    fail 'Plane Already Flying' if flying?
    @status = 'flying'
  end

end
