require_relative 'weather'

class Plane

  def initialize
    @flying = false
    @weather = []
  end

  def can_land?
    @flying && self.stormy? == false
  end

  def landed?
    !@flying
  end

  def can_take_off?
    !@flying && self.stormy? == false
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
