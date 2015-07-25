class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landed?
    !@flying
  end

  def land
    if @flying
      @flying = false
    else
      fail 'Your plane has already landed'
    end
  end

  def take_off
    @flying = true unless @flying
  end

end
