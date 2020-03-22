class Plane

  def initialize
    @status = 'flying'
  end
  
  def landed?
    @status == 'landed'
  end

  def landed
    @status = 'landed'
  end

  def left_airport
    @status = 'flying'
  end

end
