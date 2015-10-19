class Airplane
  def initialize
    @flying=true
  end

  def land
    raise 'airplane is already in airport' if flying? == false
    @flying = false
    true
  end

  def take_off
    raise 'airplane is in flight and cannot take off' if flying?
    @flying = true
  end

  def flying?
    @flying
  end
end
