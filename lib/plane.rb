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
    @status = 'grounded'
  end

  def take_off
    @status = 'flying'
  end

end
