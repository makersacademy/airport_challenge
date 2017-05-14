class Plane

  attr_reader :status

  def initialize
    @status = 'airborne'
  end

  def landed
    @status = 'landed'
  end

  def takeoff
    @status = 'airborne'
  end

  def airborne?
    @status == 'airborne'
  end


end
