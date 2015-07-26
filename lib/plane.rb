class Plane

  def initialize
    @flying = true
  end

  def can_take_off?
    not @flying
  end

  def flying?
    @flying = true
  end

  def has_landed?
    not @flying
  end

  def can_land?
    @flying
  end

  def taken_off?
    @flying
  end

end
