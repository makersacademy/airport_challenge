class Plane

  attr_reader :taking_off, :landing

  def initialize
    @in_air = true
  end

  def taking_off
    raise "Plane cannot take off, already in air!" if flying?

    @in_air = true
  end

  def landing
    raise "Plane cannot land again" unless flying?

    @in_air = false
  end

  private

  def flying?
    @in_air
  end

end
