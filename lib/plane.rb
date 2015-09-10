class Plane

  attr_reader:flying

  def initialize
    @flying = true
  end

  def flying?
    flying
  end

  def has_landed
    @flying = false
  end

  def taken_off
    @flying = true
  end
end
