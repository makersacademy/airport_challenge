class Plane
  attr_reader :status

  def initialize(status = 'grounded')
    @status = status
  end

  def land
    @status = 'grounded'
  end

  def take_off
    @status = 'flying'
  end

end
