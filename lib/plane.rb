class Plane

  attr_reader :status

  def initialize(status = 'landed')
    @status = status
  end

  def take_off
    @status = 'flying'
  end

end
