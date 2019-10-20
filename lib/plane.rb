class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def take_off
    raise "Plane cannot take off, already flying!" if flying?
  end
end
