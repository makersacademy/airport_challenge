

class Plane

  attr_accessor :status

  DEFAULT_STATUS = 'flying'

  def initialize
    @status = DEFAULT_STATUS
  end

  def land(airport)
    @status = airport
    self
  end

  def take_off
    @status = DEFAULT_STATUS
    self
  end

end
