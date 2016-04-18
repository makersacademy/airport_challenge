class Plane

  def initialize
    $flying = true
  end

  def land
    fail 'Plane not flying' unless flying?
    $flying = false
  end

  def take_off
    fail 'Plane already flying' if flying?
    $flying = true
  end

  def flying?
    $flying
  end

end