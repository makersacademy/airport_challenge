class Plane
  attr_reader :status

  def initialize(status = 'landed')
    @status = status
  end

  def land
    @status = 'landed'
  end

  def take_off
    @status = 'airborne'
  end

end
