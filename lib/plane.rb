class Plane

  attr_reader :taking_off, :landing

  def initialize
    @inAir = true
  end

  def taking_off
    raise "Plane cannot take off, already in air!" if flying?
    @inAir = true
  end

  def landing
    raise "Plane cannot land again" if !flying?
    @inAir = false
  end

  private

  def flying?
    @inAir
  end

end
