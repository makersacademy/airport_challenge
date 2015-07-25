class Plane
  def initialize
    @status = 'flying'
  end

  def flying?
    @status == 'flying'
  end

  def landed?
    @status == 'landed'
  end

  def land
    @status = 'landed'
  end

  def fly
    @status = 'flying'
  end
end


