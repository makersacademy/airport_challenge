
class Plane

  attr_reader :status

  def initialize
    @status = 'flying'
  end

  def landed
    @status = 'landed'
  end

  def takeoff
    @status = 'flying'
  end

end
