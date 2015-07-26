require_relative 'weather'

class Plane

  def initialize
    @flying = false
    @weather = []
  end

  def landing?
    @flying
  end

  def landed?
    !@flying
  end

  def departing?
    !@flying
  end

  def reported_flying
    @flying = true
  end

  def flying?
    @flying
  end

  def stormy?
    if @weather == 0
      false
    else
      true
    end
  end

end
